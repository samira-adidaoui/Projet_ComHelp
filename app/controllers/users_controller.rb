class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

	def upvote
    @user = User.find(params[:id])
		@user.upvote_from current_user
		redirect_to user_path(@user.id)
	end

	def downvote
    @user = User.find(params[:id])
		@user.downvote_from current_user
		redirect_to user_path(@user.id)
	end
end
