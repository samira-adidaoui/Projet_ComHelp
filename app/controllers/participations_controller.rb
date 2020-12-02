class ParticipationsController < ApplicationController
    def participation
        @post = Post.all.find(params[:id])
        Participation.create(user_id: current_user.id, post_id: @post.id)
        redirect_to post_path(@post)
      end
end
