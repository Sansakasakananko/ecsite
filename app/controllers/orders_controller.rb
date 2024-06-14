class OrdersController < ApplicationController
  def new
    # @book=Book.new
    # @book = Book.find(params[:id])
    @book = Book.find(params[:book_id])
    # @order = Order.new
  end


  def create
    @order = Order.new
    @book = Book.new(book_params)

    if params[:back].present?
      render :new
    else
      if @book.save
        redirect_to complete_path, notice: "登録が完了しました。"
      else
        render :new
      end 
    end
  end

  def confirm
    @order =Order.new(order_params)
    @book= Book.find(@order.book_id)
  end
  
  def complete
  end


  private
    def order_params
      params.require(:order).permit(:amount, :address, :address_number, :name, :book_id)
    end



end


