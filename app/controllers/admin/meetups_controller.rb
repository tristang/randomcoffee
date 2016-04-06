class Admin::MeetupsController < AdminController
  def index
    @meetups = Meetup.order(created_at: :asc).all
  end

  def create
    meetup = Meetup.new
    meetup.save

    all_possible_pairings = User.order(id: :asc).ids.combination(2).to_a
    all_past_pairings = Pairing.all.pluck(:user_1_id, :user_2_id)
    viable_pairings = (all_possible_pairings - all_past_pairings).flatten

    # Make a lookup of ids with sequential integers starting at 1 because
    # GraphMatching requires vertexes to be sequential numbers from 1
    sequential_ids = Hash.new
    viable_pairings.uniq.each_with_index do |id, index|
      sequential_ids[index+1] = id
    end

    sequential_id_viable_pairings = viable_pairings.map{|v| sequential_ids.key(v) }

    actual_pairings = GraphMatching::Graph::Graph[*sequential_id_viable_pairings].maximum_cardinality_matching.edges

    actual_pairings.each do |pairing|
      meetup.pairings.create(user_1_id: sequential_ids[pairing.min], user_2_id: sequential_ids[pairing.max])
    end

    redirect_to(admin_meetup_path(meetup), notice: "Created a meetup with #{meetup.pairings.count} user pairs.")
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

end
