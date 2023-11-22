class VendalistsController < ApplicationController
    def index
        @cartlists = Cartlist.all 

    end

    def vender
        user_id = params[:user_id]
        produto_id = params[:produto_id]
        quantity = params[:quantity].to_i

        inventory_list = Inventorylist.find_by(user_id: user_id, produto_id: produto_id)

        
        inventory_list.update(quantity: inventory_list.quantity - quantity)
        flash[:notice] = "Produto ATUALIZADO com sucesso!"

        user = User.first
        user.wallet.update(balance: user.wallet.balance + inventory_list.produto.preco*quantity)
        redirect_to root_path
   
    end
end
