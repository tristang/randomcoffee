class Admin::MeetupsController < AdminController
  def index
  end

  def create
    meetup = Meetup.new
    meetup.save
    redirect_to(admin_meetup_path(meetup))
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

end
