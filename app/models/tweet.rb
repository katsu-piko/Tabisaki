class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  belongs_to :user
  has_many :favorites
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :spot, length: { maximum: 16 }
    validates :comment
    validates :advice
    validates :area_id, numericality: { other_than: 1 }
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
