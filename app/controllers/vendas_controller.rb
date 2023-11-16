class VendasController < ApplicationController
    def index
        @produtos = Produto.all
        @user = User.all
    end

    def adicionar_uma_venda
        user_id = params[:user_id]
        produto_id = params[:produto_id]
        quantity = params[:quantity].to_i

     
        venda = Venda.new(user_id: user_id, produto_id: produto_id, quantity: quantity)
        venda.save
        puts("#{venda.errors.full_messages}")
        flash[:success] = "Produto adicionado ao estoque com sucesso!"
        redirect_to root_path
        
    end
end
