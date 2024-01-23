class WalletsController < ApplicationController
    before_action :set_wallet, only: [:show, :edit, :update, :destroy]

    def index
      @wallets = Wallet.all
      @wallet_last = Wallet.last
      @list_wallets = ListWallet.all
    end
  
    def show
    end
  
    def new
      @wallet = Wallet.new
    end
  
    def create
      @wallet = Wallet.new(wallet_params)
      if @wallet.reforco === nil
        @wallet.update(reforco:0)
        @wallet.save
      else
        @wallet.update(balance:@wallet.balance + @wallet.reforco)
        @wallet.save
      end

  
      if @wallet.save
        redirect_to wallets_path, notice: 'Wallet was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @wallet.update(wallet_params)
        redirect_to wallets_path, notice: 'Wallet was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end


    def destroy
      @wallet.destroy
      redirect_to wallets_path, notice: 'Wallet was successfully destroyed.'
    end
  

    def wallet_params
      params.require(:wallet).permit(:user_id, :balance, :reforco, :data)
    end
end
