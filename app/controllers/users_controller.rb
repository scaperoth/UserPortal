class UsersController < ApplicationController
  def show
    @user = (params[:id].is_number?) ? User.find(params[:id]) : User.find_by_name(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
