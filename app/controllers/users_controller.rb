class UsersController < ApplicationController
  before_action :getUserPics

  def show
    @user = User.find_by_id(current_user.id)
  end

  private
  def getUserPics
    @userPics = Pic.all.where(user_id: current_user.id).order("created_at DESC")
  end
end
