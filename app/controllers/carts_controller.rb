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
      @cart.orderables.create(user_id:, produto: @produto, cliente_id:, quantity:)

    end

    @cart.update(valor: @cart.total)

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
    @cart.update(valor: @cart.total - @cart.desconto)
    @cart.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  end

  def aplicar_acrescimo
    @cart.acrescimo = params[:acrescimo].to_f
    @cart.update(valor: @cart.total + @cart.acrescimo)
    @cart.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  end

  def data
    @cart.data = params[:data]
    @cart.update(data: @cart.data)
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
    @cart.update(valor: 0, data: nil, acrescimo: 0, desconto: 0)
    @cart.save

    @cart.orderables.destroy_all

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'carts/cart',
                                                  locals: { cart: @cart })
      end
    end
  end

  def adicionar_ao_cartlist_vista
    data = params[:data]
    desconto = params[:desconto].to_i
    acrescimo = params[:acrescimo].to_i

    cliente_id = params[:cliente_id]
    cartlist = Cartlist.create(valor: @cart.valor, forma_de_pagamento: 1, cliente_id:, data:,
                               desconto:, acrescimo:)
    user = User.first
    wallet = user.wallet

    @cart.orderables.each do |orderable|
      produto = orderable.produto
      cartlist_orderable = CartlistOrderable.create(user_id: user.id,
                                                    produto_id: produto.id,
                                                    cliente_id: orderable.cliente_id,
                                                    cartlist_id: cartlist.id,
                                                    quantity: orderable.quantity)
    end

    cartlist_orderables = CartlistOrderable.where(cartlist_id: cartlist.id)

    cartlist_orderables.each do |cartlist_orderable|
      inventory_list = Inventorylist.find_by(user_id: user.id, produto_id: cartlist_orderable.produto.id)
      inventory_list.update(quantity: inventory_list.quantity - cartlist_orderable.quantity)
      if inventory_list.save
        puts('DEU CERTO')
      else
        puts('DEU ERRADO')
      end
    end

    wallet.update(balance: wallet.balance + cartlist.valor)

    ListWallet.create(wallet_id: wallet.id, data:, valor: cartlist.valor, obs: 'Venda de Mercadorias', tipo: 1)

    # adicionar aqui
    @cart.update(valor: 0, data: nil, acrescimo: 0, desconto: 0)
    @cart.save

    @cart.orderables.destroy_all

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
    cartlist = Cartlist.create(valor: @cart.total, forma_de_pagamento: 2, cliente_id:)
    user = User.first

    @cart.orderables.each do |orderable|
      produto = orderable.produto
      cartlist_orderable = CartlistOrderable.create(user_id: user.id,
                                                    produto_id: produto.id,
                                                    cliente_id: orderable.cliente_id,
                                                    cartlist_id: cartlist.id,
                                                    quantity: orderable.quantity)
    end

    @cart.orderables.destroy_all

    @cart.update(valor: 0, data: nil, acrescimo: 0, desconto: 0)
    @cart.save

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
