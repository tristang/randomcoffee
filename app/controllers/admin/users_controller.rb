class Admin::UsersController < AdminController
  def index
    @active_users = User.active.order(first_name: :asc)
    @inactive_users = User.inactive.order(first_name: :asc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "Changes saved successfully."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if Pairing.where(user_1: @user).any? || Pairing.where(user_2: @user).any?
      return redirect_to :back, flash: { error: "Can't delete that user because they've already been paired! You may inactive them instead." }
    end

    if @user.destroy
      redirect_to admin_users_path, notice: "Deleted #{@user.full_name} successfully."
    else
      redirect_to :back
    end
  end

  def inacivate
    @user = User.find(params[:id])
    @user.update_attributes(inactive: true)
    redirect_to :back, notice: "Inactivated #{@user.full_name}. They will not be paired in the future."
  end

  def acivate
    @user = User.find(params[:id])
    @user.update_attributes(inactive: false)
    redirect_to :back, notice: "Activated #{@user.full_name}. They are now eligible for pairing."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mailbox, :department_id)
  end
end
