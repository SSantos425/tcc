class CartsController < ApplicationController
  def show
    @render_cart = false
    
  end

  def add
    cliente_id = params[:cliente_id]
    user_id = params[:user_id]
    @produto = Produto.find_by(id: params[:id])
    quantity = params[:quantity].to_i


    current_orderable = @cart.orderables.find_by(produto_id: @produto.id)

    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(user_id: user_id, produto: @produto, cliente_id: cliente_id, quantity:quantity)

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

  def aplicar_desconto
    @cart.desconto = params[:desconto].to_f
    @cart.update(valor:@cart.total - @cart.desconto)
    @cart.save
    
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  end 

  def empty_cart
    @cart.update(valor:0, desconto:0, acrescimo:0)
    @cart.save

    @cart.orderables.destroy_all
    
    redirect_to vendas_path

    
  end


  def adicionar_ao_cartlist_vista
    cliente_id = params[:cliente_id]
    cartlist = Cartlist.create(valor:@cart.total,forma_de_pagamento: 1,cliente_id:cliente_id)
    user = User.first

    @cart.orderables.each do |orderable|
      produto = orderable.produto
      cartlist_orderable = CartlistOrderable.create( user_id: user.id,
                                                      produto_id: produto.id,
                                                      cliente_id: orderable.cliente_id,
                                                      cartlist_id: cartlist.id,                                                    
                                                      quantity: orderable.quantity)
    end

    @cart.orderables.destroy_all

    @cart.update(valor:0,desconto:0,acrescimo:0)
    @cart.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  

  end  

  def adicionar_ao_cartlist_prazo
    cliente_id = params[:cliente_id]
    cartlist = Cartlist.create(valor:@cart.total, forma_de_pagamento: 2,cliente_id:cliente_id)
    user = User.first
   

    @cart.orderables.each do |orderable|
      produto = orderable.produto
      cartlist_orderable = CartlistOrderable.create( user_id: user.id,
                                                      produto_id: produto.id,
                                                      cliente_id: orderable.cliente_id,
                                                      cartlist_id: cartlist.id,                                                    
                                                      quantity: orderable.quantity)
    end

    @cart.orderables.destroy_all

    @cart.update(valor:0,desconto:0,acrescimo:0)
    @cart.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  

  end  
end
