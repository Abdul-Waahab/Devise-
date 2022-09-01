class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy] 
    
  def index
    @posts = Post.all.order("created_at DESC")
  end
  def new
    @posts = Post.new   
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
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
     redirect_to posts_path
   end    
    
  private  

  def find_post
    @post = Post.find(params[:id])
  end    
  def post_params
    params.require(:post).permit(:title, :body)
  end

end