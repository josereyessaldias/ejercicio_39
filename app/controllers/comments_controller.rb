class CommentsController < ApplicationController
	load_and_authorize_resource
	
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@post.comments << @comment
		@comment.save
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private

	def comment_params
      params.require(:comment).permit(:content)
    end
end
