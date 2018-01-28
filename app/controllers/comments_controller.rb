class CommentsController < ApplicationController
  def create
  @article = Article.find(params[:article_id])
  comment_params = params.require(:comment).permit(:commenter, :body)
  @comment = Comment.new(article_id: @article.id)
  @comment.attributes = comment_params
  if @comment.save
      redirect_to article_path(@comment.article_id)
      UserMailer.article_commented(@article.article_id).deliver_later
  else
      @like = Like.find_or_initialize_by(article: @article, user: current_user)
      render 'articles/show'
  end
end

  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
   redirect_to article_path(@comment.article)
  end

end
