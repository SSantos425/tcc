class InventorylistsController < ApplicationController
  def index
    @inventory_lists = Inventorylist.all
  end

  def new
    @inventorylist = Inventorylist.new
  end

  def adicionar_ao_estoque
    user_id = params[:user_id]
    produto_id = params[:produto_id]
    quantity = params[:quantity]

    puts "User ID: #{user_id}" # Adicione esta linha para verificar o ID do usuário
    puts "Produto ID: #{produto_id}" # Adicione esta linha para verificar o ID do produto
    puts "QQUANDITADE: #{quantity}" # Adicione esta linha para verificar o ID do usuário
   
  
    inventory_list = Inventorylist.create(user_id: user_id, produto_id: produto_id, quantity: quantity)
  
    if inventory_list.save
      flash[:success] = "Produto adicionado ao estoque com sucesso!"
      redirect_to root_path
    else
      redirect_to produtos_path, alert: "Erro ao adicionar produto ao estoque."
    end
  end
  

end
