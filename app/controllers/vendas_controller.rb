class VendasController < ApplicationController
  def index
    @produtos = Produto.all
    @user = User.all
    @cliente = Cliente.first
  end

  def adicionar_uma_venda
    user_id = params[:user_id]
    produto_id = params[:produto_id]
    quantity = params[:quantity].to_f

    # aqui ele tem que aceitar varios produtos
    venda = Venda.new(user_id:, produto_id:, quantity:)
    venda.save
    puts(venda.errors.full_messages)
    flash[:success] = 'Produto adicionado ao estoque com sucesso!'
    redirect_to root_path
  end
end
