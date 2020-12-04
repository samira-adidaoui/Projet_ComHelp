class ParticipationsController < ApplicationController

    before_action :authenticate, only: [:create, :new, :show]
    #   before_action :is_owner?, only: [:show]

    def new
        participation = Participation.new
        @post = Post.find(params[:post_id])
    end

    def show
        @post = Post.find_by_id(params[:id])
        @participant = Participation.where(:post_id => @post.id)  
        @participation = Participation.find_by(user_id: current_user.id, post_id: @post)

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

    def destroy
        @post = Post.find(params[:post_id])
        @participation = Participation.find_by(user_id: current_user.id, post_id: @post)
        @participation.destroy

        if @participation.delete
            flash[:success] = "Vote participation a bien été supprimé"
            redirect_to post_path(@post) 
        else
            flash[:danger] = "Votre participation n'a pas pu être supprimé, veuillez rééssayer ultérieurement"
            redirect_to root_path
        end
    end      
    
    private
    def authenticate
        if current_user == nil
            flash[:danger] = "Vous devez être connecté pour effectuer cette action"
            redirect_to posts_path
        end
    end
    def is_owner?
        @participation = Participation.find_by(user_id: current_user.id, post_id: @post)

        if current_user.id.to_i != @post.user.id.to_i
          flash[:danger] = "Vous ne pouvez pas acceder à cette page"
          redirect_to root_path
        end
      end
   
      
end
