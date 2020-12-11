class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  
  before_action :check_property_or_is_admin, only: [:edit, :update, :destroy]  
  
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
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to root_path 
      flash[:success] = "Annonce créée avec succès!"
    else
      flash[:danger] = "Erreur(s) à rectifier pour valider votre projet : #{@post.errors.full_messages.each {|message| message}.join('')}"
      redirect_to controller: 'posts', :action => 'new'

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
    params.require(:post).permit(:title, :description, :category_id, :datetime, :city_id)
  end

  def check_property_or_is_admin
    if current_user.id != @post.user_id && !current_user.is_admin
      flash[:alert] = "Vous n'êtes pas propriétaire de ce post !"
      redirect_to root_path
    end  
  end



end
