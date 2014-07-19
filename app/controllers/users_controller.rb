class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.create(user_params)

    session[:user_id] = @user.id

    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(session[:user_id])
    @liked_poems = @user.favorites.where(likeable_type: "poem")
  end


  def log_in

  end

  def verify
    @user = User.find_by_email(params[:user][:email])
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end



private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
