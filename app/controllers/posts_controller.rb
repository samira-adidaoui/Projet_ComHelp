class PostsController < ApplicationController
  def index
    @post = Post.all
    @category = Category.all
  end
end
