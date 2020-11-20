class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tweets

  validates :nickname, presence: true, length: { maximum: 6 }
end
