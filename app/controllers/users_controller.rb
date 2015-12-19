class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])
    redirect_to users_path 
  end
end
