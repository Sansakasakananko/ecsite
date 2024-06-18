class Book < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    has_one_attached :photo
end
