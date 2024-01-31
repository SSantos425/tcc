class ApplicationController < ActionController::Base
  before_action :set_render_cart
  before_action :set_wallet_last
  before_action :initialize_cart
  before_action :authenticate_user!

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return unless @cart.nil?

    @cart = Cart.create(valor:0,desconto:0,acrescimo:0,data:nil)
    session[:cart_id] = @cart.id
  end
  
  def set_wallet_last
    @wallet_last = Wallet.last

    
  end
end
