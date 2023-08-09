class Reaction < ApplicationRecord
  enum kind: {like: 'like', dislike: 'dislike', report: 'report'}
  belongs_to :post
  belongs_to :user
end
