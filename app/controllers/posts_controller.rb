class PostsController < ApplicationController
  before_action :authenticate, only: [:edit, :update, :destroy]
  def index
    @post = Post.all
    @category = Category.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    @participant = Participation.where(:post_id => @post.id)  
  end
  
  def new
    @post = Post.new
  end

  def create  
    if City.find_by(city_name:params[:post][:city]) == nil
      City.create(city_name:params[:post][:city])
    end
      new_post_city = City.find_by(city_name:params[:post][:city])
      @post = Post.new(title:params[:post][:title], city:new_post_city, description:params[:post][:description], user:current_user, datetime:params[:post][:datetime], category:Category.find_by(name:params[:category_name]))

    if @post.save
      redirect_to posts_path notice: "Annonce créée avec succès!"
    else
      render "new"
    end

  end

  def update
    @post = Post.find(params[:id])

    if City.find_by(city_name:params[:post][:city]) == nil
      City.create(city_name:params[:post][:city])
    end
      new_post_city = City.find_by(city_name:params[:post][:city])
      if @post.update(title:params[:post][:title], city:new_post_city, description:params[:post][:description], user:current_user, datetime:params[:post][:datetime], category:Category.find_by(name:params[:category_name]))

    #if  @post.update_attributes(post_params)
      redirect_to posts_path(@post.id), notice => "Votre post a été mis a jour"
    else
      render "edit"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Votre post a été supprimé"
  end

  def owned_post  
    unless current_user == @post.user
      flash[:alert] = "Vous n'êtes pas propriétaire de ce post!"
      redirect_to root_path
      
    end  
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category_name, :datetime)
  end


  def authenticate
    if Post.find(params[:id]) != nil && Post.find(params[:id]).user != current_user
      flash[:danger] = "Vous n'êtes pas autorisé à effectuer cette action"
      redirect_to posts_path
    end
  end



end
