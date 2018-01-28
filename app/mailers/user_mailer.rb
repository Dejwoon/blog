class UserMailer < ApplicationMailer
  def article_commented(article)
    @article = article

    mail subject: "Artykuł został skomentowany", @article.author.email
    

  end
end
