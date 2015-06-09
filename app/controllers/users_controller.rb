class UsersController < ApplicationController
  def show
    if params[:id].is_number?
      @user = User.find(params[:id])
    else
      @user = User.find_by_name(params[:id])
    end
  end

  def new
    @user = User.new
  end

  def create

    username = params[:user][:email].split("@").first
    params[:user][:name] = username

    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the User Portal!"
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
