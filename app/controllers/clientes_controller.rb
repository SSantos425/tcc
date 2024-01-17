class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to clientes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @cliente = cliente.find(params[:id])
    @cliente.destroy

    redirect_to clientes_path
  end

  private

  def cliente_params
    params.require(:cliente).permit(:nome, :cpf)
  end
end
