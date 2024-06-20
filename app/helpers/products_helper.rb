module ProductsHelper
  def current_cart?(book, cart)
    cart.line_items.map{|i| i.book_id}.include?(book.id)
  end
end
