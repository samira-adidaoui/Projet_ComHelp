module Admin

class PostsController < ApplicationController
  def index
  end

	def create
		Post.find(params[:id]).update(is_validates:true)
		redirect_to admin_posts_path
	end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])

    namePost = params[:post][:name]
    price = params[:post][:price]
    url = params[:post][:url]
    description = params[:post][:description]
    category_id = params[:post][:category_id]
      @post.update(name:namePost,price:price, url:url, description:description, category_id:category_id)

      redirect_to admin_posts_path
  end

    def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
end
