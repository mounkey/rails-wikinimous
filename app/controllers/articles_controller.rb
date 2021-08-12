class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.create(param_articles)
    @article.save
    redirect_to articles_path(@articles)
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def update
    @article.update(param_articles)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def param_articles
    params.require(:article).permit(:title, :content)
  end

  def set_articles
    @article = Article.find(params[:id])
  end
end
