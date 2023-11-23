class CartsController < ApplicationController
  def show
    @render_cart = false
    
  end

  def add
    user_id = params[:user_id]
    @produto = Produto.find_by(id: params[:id])
    quantity = params[:quantity].to_i

    current_orderable = @cart.orderables.find_by(produto_id: @produto.id)

    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(user_id: user_id, produto: @produto, quantity:quantity)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'carts/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@produto)]
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  end

  def empty_cart
    @cart.orderables.destroy_all
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
    
  end


  def adicionar_ao_cartlist
    cartlist = Cartlist.create(valor:@cart.total)
    user = User.first

    @cart.orderables.each do |orderable|
      produto = orderable.produto
      cartlist_orderable = CartlistOrderable.create( user_id: user.id,
                                                      produto_id: produto.id,
                                                      cartlist_id: cartlist.id,                                                    
                                                      quantity: orderable.quantity)
    end

    @cart.orderables.destroy_all

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  

  end  
end
