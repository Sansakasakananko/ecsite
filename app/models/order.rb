class Order < ApplicationRecord
  validates :count, presence: true
  validates :adress, length: { minimum: 5}
end
