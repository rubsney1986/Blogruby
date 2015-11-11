class ArticlesController < ApplicationController
	def new 
		@article = Article.new
	end
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end
		
	/	@article = Article.new(article_params)
		@article.save
		redirect_to @article/
	def create														
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	http_basic_authenticate_with name: "Rubsney", password: "2015", only: :destroy

	def show
	@article  = Article.find(params[:id])
	end
	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy

	  redirect_to articles_path
	end

	def index
		@articles = Article.all
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end

end



