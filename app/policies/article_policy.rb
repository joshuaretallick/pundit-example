class ArticlePolicy < ApplicationPolicy

  # Allow only registered users to create new articles.
  # Only creators of an article should be able to edit and delete the article.

  # Everyone (registered and non) can see index
  def index?
    true
  end

  def show?
    true
  end

  # User has to be registered, present? checks this
  def create?
    user.present?
  end

  # Check user that created article is making this request
  def update?
    return true if user.present? && user == article.user
  end

  def destroy?
    return true if user.present? && user == article.user
  end

  private

  def article
    record
  end

end
