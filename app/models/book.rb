class Book < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_one_attached :photo
  enum status: {saling: 1, sold_out: 2, reserve:3, backordered:4 }
  def picture
    photo.variant(resize_to_limit: [300, 300])
  end

end