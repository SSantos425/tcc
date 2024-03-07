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

  def show
    @cliente = Cliente.find(params[:id])
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])

    if @cliente.update(cliente_params)
      redirect_to clientes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cliente = cliente.find(params[:id])
    @cliente.destroy

    redirect_to clientes_path
  end

  private

  def cliente_params
    params.require(:cliente).permit(:tipo_cliente, :nome, :cpf,
                                    :cep, :logradouro, :bairro, :localidade, :uf,
                                    :cnpj, :inscricao_estadual, :inscricao_municipal, :ramo_de_atividade, :cod_ibge,
                                    :obs)
  end
end
