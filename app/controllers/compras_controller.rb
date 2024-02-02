class ComprasController < ApplicationController
  def index
    @compras = Compra.all
  end

  def new
    @compra = Compra.new
    @fornecedors = Fornecedor.all
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
    compra = params[:compra_id].to_i
    produto = params[:produto_id].to_i
    quantity = params[:quantity].to_f
    @listcompra = ListCompra.new(compra_id: compra, produto_id: produto, quantity:)
    @listcompra.save

    redirect_to compra_path(compra)
  end

  def comprar
    compra_id = params[:compra_id]
    valor_total = params[:valor_total].to_f
    list_compras = ListCompra.where(compra_id:)
    data = params[:data]

    compra = Compra.find_by(id:compra_id)
    compra.update(tipo:0)

    wallet = Wallet.last

    list_compras.each do |list_compra|
      inventory_list = Inventorylist.find_by(user_id: current_user.id, produto_id: list_compra.produto_id)
      inventory_list.update(quantity: inventory_list.quantity + list_compra.quantity)
      if inventory_list.save
        puts('DEU CERTO')
      else
        puts('DEU ERRADO')
      end
    end

    

    wallet.update(balance: wallet.balance - valor_total)
    ListWallet.create(wallet_id: wallet.id, data:data, valor: valor_total, obs: 'Compra de Mercadorias para Revenda', tipo: 0)

    redirect_to wallets_path
  end

  def atualizar_item_listcompra
    list_compra_id = params[:list_compra]
    compra_id = params[:compra_id].to_i
    quantity = params[:quantity].to_f

    current_listcompra = ListCompra.find_by(id: list_compra_id)
    current_listcompra.update(quantity:)

    redirect_to compra_path(compra_id)
  end

  def remover_item_listcompra
    compra = params[:compra_id].to_i

    ListCompra.find_by(id: compra).destroy

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
      :frete
    )
  end
end
