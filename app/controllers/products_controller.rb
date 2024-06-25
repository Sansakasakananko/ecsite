class ProductsController < ApplicationController
  before_action :move_to_signed_in

  def index
    @books = Book.all
    @cart = current_cart

    if params[:title].present? || params[:author].present?
      @books = @books.where("title LIKE ? AND author LIKE ?",
                             "%#{params[:title]}%",
                             "%#{params[:author]}%")
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def move_to_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
