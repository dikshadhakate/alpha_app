class ArticlesController < ApplicationController

	before_action :set_article, only: [:show, :update, :destroy, :edit]

	def show
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			flash[:success] = "Article was created successfully."
			# render plain: @article.inspect
			redirect_to @article
		else
			render 'new'
		end	
	end

	def edit
	end

	def update
		@article.update_attributes(article_params)
		if @article.save
			flash[:success] = "Article was updated successfully."
			redirect_to @article
		else
			render 'edit'	
		end
	end	

	def destroy
		if @article.destroy
			flash[:danger] = "Article was deleted successfully."
			redirect_to articles_path
		else
		end	
	end	

	private

	def article_params
		params.require(:article).permit(:title, :description)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end
