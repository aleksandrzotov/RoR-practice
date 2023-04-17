class Post < ApplicationRecord
  belongs_to :user

  def like
  end

  def dislike
  end
end
