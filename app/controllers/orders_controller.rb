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
      @book = Book.find(order_params[:book_id])
      @book.sold_out! 
      redirect_to complete_orders_path
    else
      render "confirm"
    end
  end

  def complete
    CompleteMailer.complete_mail(current_user).deliver
  end

  private

  def order_params
    params.require(:order).permit(:count, :adress, :adress_number, :book_id)
  end  

end