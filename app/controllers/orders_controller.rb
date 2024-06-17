class OrdersController < ApplicationController
  def new
    @order = Order.new
    @book = Book.find(params[:book_id])
  end


  def confirm
    @order = Order.new(order_params)
    @book = Book.find(order_params[:book_id])

  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to complete_orders_path
    else
      render "confirm"
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:count, :adress, :book_id)
  end  

end