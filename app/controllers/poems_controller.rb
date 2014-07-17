class PoemsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
  end

  # def show
  #   @user = User.find(params[:id])
  # end

private
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :password)
  # end
end
