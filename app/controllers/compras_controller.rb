class ComprasController < ApplicationController
  def index
    @compras = Compra.all
  end

  def new
    @compra = Compra.new
  end

  def create
    @compra = Compra.new(compra_params)

    if @compra.save
        redirect_to compras_path
    else
        render :new, status: :unprocessable_entity
    end

  end

  def show
    @compra = Compra.find(params[:id])
    @produtos = Produto.all
    @list_compras = ListCompra.all
  end

  def incluir_produtos
    compra = params[:compra_id].to_i
    produto = params[:produto_id].to_i
    quantity = params[:quantity]
    @listcompra = ListCompra.new(compra_id:compra,produto_id:produto,quantity:quantity)
    @listcompra.save

    redirect_to compra_path(compra)
  end

  private
    def compra_params 
      params.require(:compra).permit(
      :fornecedor_id,
      :numero_nota,
      :serie,
      :data_emissao,
      :data_recebimento,
      :total_nota,
      :total_produtos,
      :desconto,
      :acrescimos,
      :frete)
    end

end
