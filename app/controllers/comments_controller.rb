class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)

		render json: @comment, status: :created
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
	end

	private def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end