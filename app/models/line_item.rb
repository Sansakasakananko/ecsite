class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def add_product(book_id)
    line_items.find_or_initialize_by(book_id: book_id)
  end
  
  
  def total_price
    book.price * quantity
  end
  
  
end
