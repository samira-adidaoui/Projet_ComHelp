class ParticipationsController < ApplicationController
    def new
        participation = Participation.new
        @post = Post.find(params[:post_id])

    end

    def show
        @participation = Participation.find(params[:id])
    end

    def create
        @post = Post.find(params[:post_id])
        @participation = Participation.new(user_id: current_user.id, post_id: @post.id)

        if @participation.save
            flash[:notice] = "Vous êtes bien inscrit"
            redirect_to post_path(@post) 
        else
            redirect_to post_path(@post) 
        end
    end
    

   
      
end