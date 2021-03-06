class ArticlesController < ApplicationController

	before_action :set_article, only: [:show, :update, :destroy, :edit]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def show
	end

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user = current_user
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
		params.require(:article).permit(:title, :description, category_ids: []) #[] defines it is gonna come in array as we have many to many association with category
	end

	def set_article
		@article = Article.find(params[:id])
	end

	def require_same_user
		if current_user != @article.user and !current_user.admin?
			flash[:danger] = "You can only edit or delete your own articles"
			redirect_to root_path
		end	
	end
end
