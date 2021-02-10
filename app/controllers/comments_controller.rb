class CommentsController < ApplicationController

	before_action	:require_sign_in
	before_action :authorize_user, only: [:destroy]
	
	
	def create
		if params[:post_id]
			parent = Post.find(params[:post_id])
			comment = Comment.new(comment_params)
			comment.user = current_user
			comment.commentable = parent
		
			if comment.save
				flash[:notice] = "Comment Saved Successfully"
				redirect_to [parent.topic, parent]
			else
				flash[:alert] = "Comment failed to save."
				redirect_to [parent.topic, parent]
			end
		
		elsif params[:topic_id]
			parent = Topic.find(params[:topic_id])
			comment = Comment.new(comment_params)
			comment.user = current_user
			comment.commentable = parent
			
			if comment.save
				flash[:notice] = "Comment Saved Successfully"
				redirect_to [parent]
			else
				flash[:alert] = "Comment failed to save."
				redirect_to [parent]
			end
		end
	end
		
	
	def destroy
		if params[:post_id]
			parent = Post.find(params[:post_id])
			comment = parent.comments.find(params[:id])
			if comment.destroy
				flash[:notice] = "Comment was deleted successfully"
				redirect_to [parent.topic, parent]
			else
				flash[:alert] = "Comment couldn't be deleted. Please try again."
				redirect_to [parent.topic, parent]
			end
		
		elsif params[:topic_id]
			parent = Topic.find(params[:topic_id])
			comment = parent.comments.find(params[:id])
			if comment.destroy
				flash[:notice] = "Comment was deleted successfully"
				redirect_to [parent]
			else
				flash[:alert] = "Comment couldn't be deleted. Please try again."
				redirect_to [parent]
			end
		end
	end
	
	private
	
	def comment_params
		params.require(:comment).permit(:body, :commentable)
	end

	def authorize_user
		comment = Comment.find(params[:id])
		unless current_user == comment.user || current_user.admin?
			flash[:alert] = "You don't have permission to delete a comment."
			redirect_to [comment.post.topic, comment.commentable]
		end
	end

end
