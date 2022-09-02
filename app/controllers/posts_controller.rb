class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  before_action :authorization, except: %i[show index]
  
  def index
    @post = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
      else
      render :new
    end
  end    

  def show;end   

  def edit;end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path 
      else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end    
    
  private 

  def authorization
    authorize @post
  end 

  def find_post
    @post = Post.find(params[:id])
  end 
     
  def post_params
    params.require(:post).permit(:title, :body)
  end
end