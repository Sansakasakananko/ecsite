class OrdersController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    if @book.saling?
      @order = Order.new
    else
      redirect_to products_path
    end
  end


  def confirm
    @book = Book.find(order_params[:book_id])
    if @book.saling?
    @order = Order.new(order_params)
    else
      redirect_to products_path
    end
  end

  def create
    @book = Book.find(order_params[:book_id])
    @order = Order.new(order_params)
    if @book.saling?
      if @order.save
        @book = Book.find(order_params[:book_id])
        @book.sold_out! 
        redirect_to complete_orders_path, notice: 'Order was sussessfully created.'
      else
        render "confirm"
      end
    else 
      redirect_to products_path
    end
  end

  def complete
    CompleteMailer.complete_mail(current_user).deliver
  end

  private

  def order_params
    params.require(:order).permit(:count, :adress, :adress_number, :book_id , :status)
  end  

end