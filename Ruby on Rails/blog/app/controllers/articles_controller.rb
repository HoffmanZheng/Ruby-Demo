class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end

  # ---> instantiates a new article, but does not save it 
  # -> validations are not checked -> there will be no error messages
  # this article obj will be used in the view when building the form
  def new
    @article = Article.new
  end

  # ---> instantiates a new article with values for the title and body
  # attempt to save @article, therefore validations are checked
  # successfully saved -> articles/#{@article.id} or failed -> articles/new.html.erb
  def create
    @article = Article.new(article_params)

    if @article.save
      # ---> redirect_to will cause browser to make a new request,
      # where as `render` renders the specified view for the current request
      # it's important to use `redirect_to` after mutating the database or application status
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # ---> [strong typing]: specify what values are allowed in param
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
