class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :reactions, dependent: :destroy

  def self.recovery_password
  end

end
