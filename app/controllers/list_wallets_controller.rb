class ListWalletsController < ApplicationController
  def reforco_caixa
    wallet_id = params[:wallet_id]
    data = params[:data]
    valor = params[:valor].to_f
    obs = params[:obs]

    @list_wallet = ListWallet.new(wallet_id:wallet_id,data:data, valor:valor, obs:obs,tipo:1)
    @list_wallet.save

    wallet = Wallet.last
    wallet.update(balance:wallet.balance + valor)

    redirect_to wallets_path
  end

  def retirar_caixa
    wallet_id = params[:wallet_id]
    data = params[:data]
    valor = params[:valor].to_f
    obs = params[:obs]

    @list_wallet = ListWallet.new(wallet_id:wallet_id,data:data, valor:valor, obs:obs,tipo:0)
    @list_wallet.save

    wallet = Wallet.last
    wallet.update(balance:wallet.balance - valor)
    redirect_to wallets_path
  end

  def fechar_caixa
    # caixa_status:1-ABERTO | caixa_status:0 - FECHADO
    @wallet.last.update(caixa_status:0)
    redirect_to wallets_path
  end
end
