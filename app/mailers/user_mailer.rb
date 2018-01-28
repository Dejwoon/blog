class UserMailer < ApplicationMailer
  def article_commented(article_id)
    @article = Article.find(article_id)

    mail subject: "Artykuł został skomentowany", to: @article.author.email
  end
end
