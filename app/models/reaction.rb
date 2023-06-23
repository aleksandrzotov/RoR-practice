class Reaction < ApplicationRecord
  enum kind: {like: 'like', dislike: 'dislike'}
  belongs_to :post
  belongs_to :user
end
