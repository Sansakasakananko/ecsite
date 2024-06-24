class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :books, through: :order_details
  # validates :count, presence: true
  validates :adress, length: { minimum: 5}

  def total_price
    order_details.sum {|order| order.total_price }
  end
  def total_number
    order_details.sum {|order| order.quantity}
  end
end
