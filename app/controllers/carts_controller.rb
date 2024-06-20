class CartsController < ApplicationController
  before_action :current_cart

  # GET /carts/1 or /carts/1.json
  def show
    @cart = Cart.find(params[:id])
    @line_items = @cart.line_items
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to products_path, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private

  def current_cart
    @current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @current_cart.id
    @current_cart
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
