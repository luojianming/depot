class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def access_count
    if session[:counter].nil?
      counter = 1
      session[:counter] = counter
      counter
    else
      session[:counter] = session[:counter]+1
      session[:counter]
    end
  end

  def clear_counter
    session[:counter] = 0
  end

  
end
