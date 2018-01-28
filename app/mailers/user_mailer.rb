class UserMailer < ApplicationMailer
  def article_commented(article)
    @article = article
    mail subject: "Artykuł został skomentowany", to: @article.author.email
  end
end
