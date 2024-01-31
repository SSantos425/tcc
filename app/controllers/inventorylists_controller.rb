class InventorylistsController < ApplicationController
  def index
    @inventory_lists = Inventorylist.all
  end


  def edit
    @inventory_list = Inventorylist.find(params[:id])
  end

  def update
    @inventory_list = Inventorylist.find(params[:id])

    if @inventory_list.update(inventorylist_params)
      redirect_to inventorylists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def adicionar_ao_estoque
    user_id = params[:user_id]
    produto_id = params[:produto_id]
    quantity = params[:quantity].to_i

    inventory_list = Inventorylist.find_by(user_id:, produto_id:)

    if inventory_list.nil?
      inventory_list = Inventorylist.new(user_id:, produto_id:, quantity:)
      inventory_list.save
      puts("#{inventory_list.errors.full_messages}")
      flash[:success] = 'Produto adicionado ao estoque com sucesso!'
      redirect_to root_path

    else
      inventory_list.update(quantity: inventory_list.quantity + quantity)
      flash[:notice] = 'Produto ATUALIZADO com sucesso!'

      redirect_to root_path
    end
  end


  private

    def inventorylist_params

      params.require(:inventorylist).permit(:user_id,:produto_id,:quantity)
    
    end
end
