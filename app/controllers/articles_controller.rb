class ArticlesController < ApplicationController
	before_action :authenticate_user!

	def index
		render json: Article.all
	end

	def show
		render json: Article.find(params[:id])
	end

	def create
		@article = current_user.articles.create(article_params)

		if @article.valid?
			render json: @article, status: :created, location: @article
		else
			render json: @article.errors, status: :unprocessable_entity
		end
	end

	def update
		@article = Article.find(params[:id])
		authorize! :read, @article

		if @article.update(article_params)
			render json: @article
		else
			render json: @article.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@article = Article.find(params[:id])
		authorize! :read, @article
		@article.destroy
	end

	private def article_params
		params.require(:article).permit(:title, :text)
	end
end