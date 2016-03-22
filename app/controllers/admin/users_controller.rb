class Admin::UsersController < AdminController
  def index
    @user_list = User.all.order(first_name: :asc)
  end
end
