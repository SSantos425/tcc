class ComprasController < ApplicationController
  def index
    @compras = Compra.all
  end

  def new
  end
end
