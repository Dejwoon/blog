class CommentsController < ApplicationController
  def create
   comment_params = params.require(:comment).permit(:commenter, :body, :article_id)
   @comment = Comment.new(comment_params)
   @comment.save
   redirect_to article_path(@comment.article_id)
  end
end
