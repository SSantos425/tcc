class CartlistOrderablesController < ApplicationController
  def index
  end

  def show
    @cartlist = Cartlist.find(params[:id])
    @cartlist_orderables = CartlistOrderable.where(cartlist_id: params[:id])
  end

  def cartlist_data
    @cartlist_data = Cartlist.where(data:params[:data])
  end

  def vendas_geral
    @cartlists = Cartlist.all
  end

  private

  def produto_params
    params.require(:cartlist).permit(:cartlist_id)
  end
end
