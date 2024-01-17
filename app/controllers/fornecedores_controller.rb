class FornecedoresController < ApplicationController
  def index
    @fornecedores = Fornecedor.all
  end


  def show
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    if @fornecedor.save
      redirect_to fornecedores_path, notice: 'fornecedor was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @fornecedor.update(fornecedor_params)
      redirect_to fornecedores_path, notice: 'fornecedor was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fornecedor.destroy
    redirect_to fornecedores_path, notice: 'fornecedor was successfully destroyed.'
  end

  private

  def set_fornecedor
    @fornecedor = fornecedor.find(params[:id])
  end

  def fornecedor_params
    params.require(:fornecedor).permit(:nome,:endereco,:cnpj,:insc_estadual)
  end

end
