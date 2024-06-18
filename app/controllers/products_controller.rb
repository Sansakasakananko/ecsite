class ProductsController < ApplicationController
  before_action :move_to_signed_in
  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
