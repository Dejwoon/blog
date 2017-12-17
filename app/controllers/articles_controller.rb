class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :edit, :update, :destroy]
  before_action :authorize_article, only: [:edit, :update, :destroy]
  def index
    @articles = Article.includes(:author).order(created_at: :desc)
    if params[:q].present?
    @articles = @articles.select do |article|
      article.tags.include?(params[:q])
      end
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    if @article.save
        redirect_to article_path(@article)
        session[:commenter] = @comment.commenter
    else
      render 'new'
    end
  end

  def show
  @comment = Comment.new(commenter: session[:commenter])
  @like = Like.find_or_initialize_by(article: @article, user: current_user)
  end

  def edit
  if @article.author != current_user
    redirect_to articles_path
  end
  end

  def update

   @article.attributes = article_params
    if @article.save
       redirect_to article_path(@article)
    else
     render 'edit'
    end
  end

  def destroy

   @article.destroy
   redirect_to articles_path
  end

   private

   def article_params
    params.require(:article).permit(:title, :text, :tags)
  end

   def find_article
     @article = Article.find(params[:id])
   end

   def authorize_article
     if @article.author != current_user
       redirect_to articles_path, alert: "wypad"
     end
end
end
