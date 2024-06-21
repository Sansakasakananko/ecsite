class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  before_action :current_cart

  def after_sign_in_path_for(resource)
    products_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] = @current_cart.id
    @current_cart
  end
end
