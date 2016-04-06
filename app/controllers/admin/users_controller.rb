class Admin::UsersController < AdminController
  def index
    @user_list = User.all.order(first_name: :asc)
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
      return redirect_to :back, flash: { error: "Can't delete that user because they've already been paired!" }
    end

    if @user.destroy
      redirect_to admin_users_path, notice: "Deleted #{@user.full_name} successfully."
    else
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mailbox, :department_id)
  end
end
