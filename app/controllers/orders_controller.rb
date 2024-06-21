class OrdersController < ApplicationController
  before_action :set_current_cart, only: [:new, :confirm, :create]

  def new
    @order = Order.new
    @line_items = @current_cart.line_items
    @books = @line_items.map { |line_item| line_item.book }

    saling_book = @books.find { |book| book.saling? }

    if saling_book
      @book = saling_book
    else
      redirect_to products_path, alert: 'カート内の商品は現在販売中ではありません。'
    end
  end

  def confirm
    @book = Book.find(params[:order][:book_id])
    if @book.saling?
      @order = Order.new(order_params)
      @line_items = @current_cart.line_items
    else
      redirect_to products_path
    end
  end

  def create
    @book = Book.find(order_params[:book_id])
    @order = Order.new(order_params)
    @line_items = @current_cart.line_items
  
      if @order.save!
        OrderDetail.create_items(@order, @line_items)
        @book.sold_out!
        redirect_to complete_order_path(@order), notice: '注文が正常に登録されました。'
      else
        render "confirm"
      end    
    end

    def complete
      @order = Order.find(params[:id])
      CompleteMailer.complete_mail(current_user).deliver
    end

  private

  def order_params
    params.require(:order).permit(:count, :adress, :adress_number, :book_id, :status)
  end

  def set_current_cart
    @current_cart = current_cart
  end
end
