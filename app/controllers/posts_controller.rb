class PostsController < ApplicationController
  def index
    @post = Post.all
    @category = Category.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

end
