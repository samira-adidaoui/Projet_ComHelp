class UsersController < ApplicationController
  before_action :only : [:upvote, :downvote] 
  def show
    @user = User.find(params[:id])
  end

  def upvote
    @user.upvote_from current_user
    redirect_to posts_path
  end

  def downvote
    @user.downvote_from current_user
    redirect_to posts_path
  end

end
