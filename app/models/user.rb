class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :favorites

  validates :nickname, presence: true, length: { maximum: 6 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com', nickname: '閲覧用') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
