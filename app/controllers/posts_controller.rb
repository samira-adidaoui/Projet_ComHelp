class PostsController < ApplicationController
  def index
    @post = Post.all
    @category = Category.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    @participant = Participation.where(:post_id => @post.id)  

  end

  def participation
    @post = Post.all.find(params[:id])
    Participation.create(user_id: current_user.id, post_id: @post.id)
    redirect_to post_path(@post)
  end
end
