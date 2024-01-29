class CartlistOrderablesController < ApplicationController
  def index
    @cartlists = Cartlist.all
    @cartlist_orderables = CartlistOrderable.all
  end

  def show
    @cartlist = Cartlist.find(params[:id])
    @cartlist_orderables = CartlistOrderable.where(cartlist_id: params[:id])
  end

  private

  def produto_params
    params.require(:cartlist).permit(:cartlist_id)
  end
end
