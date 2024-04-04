class ArticlesController < ApplicationController

  def home
    birthdate = Date.new(1992, 11, 20)
    now = Date.today
    if birthdate.month > now.month || (birthdate.month == now.month && birthdate.day > now.day)
      @age = now.year - birthdate.year - 1
    else
      @age = now.year - birthdate.year
    end
  end

  def index
    @articles = Article.all
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article = Article.create! params.require(:article).permit(:title, :content, :published_at, :slug)
    redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :published_at, :slug, :id)
  end
end
