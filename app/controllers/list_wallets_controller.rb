class ListWalletsController < ApplicationController
  def index
    @wallets = Wallet.all
    @list_wallets = ListWallet.all
  end

  def reforco_caixa
    wallet_id = params[:wallet_id]
    data = params[:data]
    valor = params[:valor].to_f
    obs = params[:obs]

    @list_wallet = ListWallet.new(wallet_id:, data:, valor:, obs:, tipo: 1)
    @list_wallet.save

    wallet = Wallet.last
    wallet.update(balance: wallet.balance + valor)

    redirect_to wallets_path
  end

  def retirar_caixa
    wallet_id = params[:wallet_id]
    data = params[:data]
    valor = params[:valor].to_f
    obs = params[:obs]

    @list_wallet = ListWallet.new(wallet_id:, data:, valor:, obs:, tipo: 0)
    @list_wallet.save

    wallet = Wallet.last
    wallet.update(balance: wallet.balance - valor)
    redirect_to wallets_path
  end

  def fechar_caixa
    wallet = Wallet.last
    # caixa_status:0-ABERTO | caixa_status:1- FECHADO

    wallet.update(caixa_status: 1, valor_final: wallet.balance)
    redirect_to wallets_path
  end
end
