class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new(sponsored_post_params)
    @sponsored_post.topic = @topic
  
    if @sponsored_post.save
      flash[:notice] = "Sponsored post saved successfully"
      redirect_to [@topic, @sponsored_post]
    
    else
      flash.now[:alert] = "There was an error creating the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]
    
    if @sponsored_post.save
      flash[:notice] = "Sponsored Post updated successfully"
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flast[:alert] = "There was an error updating your post."
      render :edit
    end
  end

  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])
    
    if @sponsored_post.destroy
      flash[:notice] = "\"#{@sponsored_post.title}\" was deleted successfully."
      redirect_to @sponsored_post.topic
    else
      flash.now[:alert] = "There was an error deleting the sponsored post."
      render :show
    end
  end
  
  def sponsored_post_params
    params.permit(:title, :body, :price)
  end
end
