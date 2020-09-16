class UsersController < ApplicationController
  
  def index


  end

  def new

  end

  private
  def user_params
    params.require(:user).permit(:nickname, :///////)

end
