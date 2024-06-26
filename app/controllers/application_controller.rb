class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  before_action :current_cart

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      books_path(admin: true)
    else
      products_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path(admin: true)
    else resouce == :user
      new_user_session_path
    end
  end

  private

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] = @current_cart.id
    @current_cart
  end
end
