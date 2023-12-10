class WalletsController < ApplicationController
    before_action :set_wallet, only: [:show, :edit, :update, :destroy]

    def index
      @wallets = Wallet.all
    end
  
    def show
    end
  
    def new
      @wallet = Wallet.new
    end
  
    def create
      @wallet = Wallet.new(wallet_params)
  
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
  
    private
  
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end
  
    def wallet_params
      params.require(:wallet).permit(:user_id, :balance)
    end
end
