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
