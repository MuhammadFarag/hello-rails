# frozen_string_literal: true

class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new; end

  def create
    @article = Article.new(article_parameters)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def article_parameters
    params.require(:article).permit(:title, :text)
  end

end
