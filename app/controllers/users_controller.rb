class UsersController < ApplicationController
  before_action :set_user, only: [:upvote, :downvote] 
  def show
    @user = User.find(params[:id])
  end

  def upvote
    @user = User.find(params[:id])
    @user.upvote_from current_user
    redirect_to posts_path
  end

  def downvote
    @user = User.find(params[:id])
    @user.downvote_from current_user
    redirect_to posts_path
  end

end
