class Book < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_one_attached :photo

  def picture
    photo.variant(resize_to_limit: [300, 300])
  end

end