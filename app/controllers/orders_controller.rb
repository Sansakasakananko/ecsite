class OrdersController < ApplicationController
  def new
    @book = Book.new
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

  def confirmable
    @book = Book.new(book_params)
  end
  
  def complete
  end
  


end


private
  def order_params
  params.require(:order).permit(:count, :address, :book_id)
  end

end