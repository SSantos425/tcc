class ProdutosController < ApplicationController
  # before_action :authenticate_user!
  def index
    @produtos = Produto.all
    @user = User.all
    @compras = Compra.all
  end

  def new
    @produto = Produto.new
  end

  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      redirect_to produtos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @produto = Produto.find(params[:id])
  end

  def update
    @produto = Produto.find(params[:id])

    if @produto.update(produto_params)
      redirect_to produtos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    redirect_to produtos_path
  end

  private

  def produto_params
    params.require(:produto).permit(:nome, :unidade, :preco, :preco_compra)
  end
end
