class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
    
      flash[:notice] = "Post saved successfully"
      redirect_to @post
    else
    
      flash.now[:alert] = "There error an error creative the post. Please try again"
      render :new
    end
  end

  def edit
  end
  
  def post_params
    params.permit(:title, :body)
  end
end
