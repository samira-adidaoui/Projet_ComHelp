class PostsController < ApplicationController
  def index
    @post = Post.all
    @category = Category.all
  end

  def show
    @all_post = Post.all
    @post = Post.find_by_id(params[:id])
    @participation = @all_post.categories
  end

end
