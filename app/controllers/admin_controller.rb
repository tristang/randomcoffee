class AdminController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "temporarypassword"

  def users
    @user_list = User.all.order(first_name: :asc)
  end
end
