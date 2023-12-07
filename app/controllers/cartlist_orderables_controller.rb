class CartlistOrderablesController < ApplicationController
  def index
    @cartlist = Cartlist.all
  end

  def show
    @cartlist = Cartlist.find(params[:id])
    @cartlist_orderables = CartlistOrderable.where(cartlist_id:params[:id])
  end

  def dar_baixa_na_venda
    user = User.first
    wallet = user.wallet

    cartlist = Cartlist.find(params[:id])
    cartlist_orderables = CartlistOrderable.where(cartlist_id:params[:id])

    cartlist_orderables.each do |cartlist_orderable|
      inventory_list = Inventorylist.find_by(user_id: user.id, produto_id: cartlist_orderable.produto.id)
      inventory_list.update(quantity: inventory_list.quantity - cartlist_orderable.quantity)
    end

    wallet.update(balance: wallet.balance + cartlist.valor)
    redirect_to root_path
  end

  private

  def produto_params
    params.require(:cartlist).permit(:cartlist_id)
  end
end
