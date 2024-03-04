class ComprasController < ApplicationController
  def index
    @compras = Compra.all
  end

  def new
    @compra = Compra.new
    @fornecedores = Fornecedor.all
  end

  def create
    @compra = Compra.new(compra_params)
    @compra.update(tipo:1)

    if @compra.save
      redirect_to compras_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def compras_cliente
    @cartlist_orderables = CartlistOrderable.where(cliente_id: params[:cliente_id])
  end

  

  def show
    @compra = Compra.find(params[:id])
    @produtos = Produto.all
    @list_compras = ListCompra.all
  end

  def incluir_produtos
    compra_id = params[:compra_id].to_i
    produto_id = params[:produto_id].to_i
    quantity = params[:quantity].to_f
  
    @listcompra = ListCompra.new(compra_id: compra_id, produto_id: produto_id, quantity: quantity)
    @listcompra.save

    @list_compras = ListCompra.all
    @produtos = Produto.all
    @compra = Compra.find_by(id:compra_id)
    render turbo_stream: turbo_stream.update('compralist', partial: 'compras/carrinhocompra', locals: { compra: @compra })
  end
  

  def comprar
    compra_id = params[:compra_id]
    valor_total = params[:valor_total].to_f
    list_compras = ListCompra.where(compra_id:)
    data = params[:data]
    wallet = Wallet.last

    @list_compras = ListCompra.all
    @produtos = Produto.all

    @compra = Compra.find_by(id:compra_id)
    @compra.update(tipo:0)

    list_compras.each do |list_compra|
      inventory_list = Inventorylist.find_by(user_id: current_user.id, produto_id: list_compra.produto_id)
      inventory_list.update(quantity: inventory_list.quantity + list_compra.quantity)
    end

    wallet.update(balance: wallet.balance - valor_total)
    ListWallet.create(wallet_id: wallet.id, data:data, valor: valor_total, obs: 'Compra de Mercadorias para Revenda', tipo: 0)

    render turbo_stream: turbo_stream.update('compralist', partial: 'compras/carrinhocomprafinalizado', locals: { compra: @compra })
  end

  def atualizar_item_listcompra
    list_compra_id = params[:list_compra]
    compra_id = params[:compra_id].to_i
    quantity = params[:quantity].to_f

    @compra = Compra.find_by(id:compra_id)
    @list_compras = ListCompra.all
    @produtos = Produto.all

    current_listcompra = ListCompra.find_by(id: list_compra_id)
    current_listcompra.update(quantity: quantity)

    render turbo_stream: turbo_stream.update('compralist', partial: 'compras/carrinhocompra', locals: { listcompra: @list_compras })

    
  end

  def remover_item_listcompra
    list_compra_id = params[:list_compra]
    compra_id = params[:compra_id].to_i

    @compra = Compra.find_by(id:compra_id)

    ListCompra.find_by(id: list_compra_id).destroy

    @list_compras = ListCompra.all
    @produtos = Produto.all
    render turbo_stream: turbo_stream.update('compralist', partial: 'compras/carrinhocompra', locals: { compra: @compra })
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
      :frete
    )
  end
end
