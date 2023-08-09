class ReactionSerializer < ActiveModel::Serializer
  attributes :id, :kind, :user_id, :post_id
end
