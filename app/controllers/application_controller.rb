class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    products_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end


  private
  def current_cart
    @current_cart = Cart.find_or_create_by(id: session[:cart_id])
    @current_cart = Cart.create unless @current_cart
    session[:cart_id] = @current_cart.id
    @current_cart
  end
end
