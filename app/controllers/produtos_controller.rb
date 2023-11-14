class ProdutosController < ApplicationController
  #before_action :authenticate_user!
  def index
    @produtos = Produto.all
    @user = User.all
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

  def adicionar_ao_estoque
    produto = Produto.find(params[:id])
    quantidade_adicionada_ao_estoque = params[:produto][:quantidade].to_i

    
    
    redirect_to produtos_path
  end

 

  def destroy
    @produto = Produto.find(params[:id]) 
    @produto.destroy

    redirect_to produtos_path
  end


  private
      def produto_params
          params.require(:produto).permit(:nome,:preco)
        
      end

end
