class UserMailer < ApplicationMailer
  def article_commented(article_id)
    @article = Article.find(article_d)
    
    mail subject: "Artykuł został skomentowany", to: @article.author.email
  end
end
