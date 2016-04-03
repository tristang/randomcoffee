class Admin::MeetupsController < AdminController
  def index
  end

  def create
    meetup = Meetup.new
    meetup.save

    User.all.each_slice(2) do |first_user, second_user|
      meetup.pairings.create(user_1: first_user, user_2: second_user)
    end

    redirect_to(admin_meetup_path(meetup))
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

end
