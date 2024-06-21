class OrderDetail < ApplicationRecord
  belongs_to :book
  belongs_to :order

  def self.create_items(order,line_items)
    line_items.each do |item|
      OrderDetail.create!(order_id: order.id, book_id: item.book_id, quantity: item.quantity )
      LineItem.find(item.id).delete
    end
  end

  def subtotal
    quantity * book.price 
  end


  def total_price
    order_details.sum { |order| order.subtotal }
  end

  def total_number
    order_details.sum { |order| order.quantity }
  end
end
