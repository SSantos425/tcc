class CartlistOrderablesController < ApplicationController
  include Prawn::View

  def index
  end

  def show
    @cartlist = Cartlist.find(params[:id])
    @cartlist_orderables = CartlistOrderable.where(cartlist_id: params[:id])
  end

  def cartlist_data
    @cartlist_data = Cartlist.where(data:params[:data])
  end

  def vendas_geral
    @cartlists = Cartlist.all
  end

  def download_pdf
    cartlists = Cartlist.all
    pdf = Prawn::Document.new

    pdf.text 'RELATÓRIO GERAL DE VENDAS', size: 30 , style: :bold

    cartlists.each do |cartlist|
      pdf.text "Cliente: #{cartlist.cliente.nome} | Data: #{cartlist.data&.strftime('%d/%m/%Y')}", style: :bold
      
      cart_items = cartlist.cartlist_orderables.map do |cartlist_orderable|
        [
          cartlist_orderable.produto.nome,
          cartlist_orderable.quantity,
          cartlist_orderable.produto.unidade,
          cartlist_orderable.total
        ]
      end

      pdf.table [["Produto", "Quantidade", "Unidade", "Valor Parcial"]] + cart_items,
          header: true,
          column_widths: { 0 => 200, 1 => 100, 2 => 100, 3 => 100 },
          cell_style: { border_width: 0.5 } do
          row(0).style(font_style: :bold, background_color: 'CCCCCC')
          columns(0..3).align = :center
      end


      pdf.text "Total: #{cartlist.valor}", style: :bold
      #pdf.text "Forma de Pagamento: #{cartlist.forma_de_pagamento == 1 ? 'A VISTA' : 'A PRAZO'}", style: :bold
      pdf.move_down 20
    end

    send_data(pdf.render,
    filename:'vendas_geral.pdf',
    type: 'application/pdf')
  end

  def download_pdf_data
    cartlists = Cartlist.where(data: params[:data])
    pdf = Prawn::Document.new

    pdf.text "RELATÓRIO DE VENDAS #{cartlists.first.data&.strftime('%d/%m/%Y')}", size: 30 , style: :bold

    cartlists.each do |cartlist|
      pdf.text "Cliente: #{cartlist.cliente.nome}", style: :bold
      
      cart_items = cartlist.cartlist_orderables.map do |cartlist_orderable|
        [
          cartlist_orderable.produto.nome,
          cartlist_orderable.quantity,
          cartlist_orderable.produto.unidade,
          cartlist_orderable.total
        ]
      end

      pdf.table [["Produto", "Quantidade", "Unidade", "Valor Parcial"]] + cart_items,
          header: true,
          column_widths: { 0 => 200, 1 => 100, 2 => 100, 3 => 100 },
          cell_style: { border_width: 0.5 } do
          row(0).style(font_style: :bold, background_color: 'CCCCCC')
          columns(0..3).align = :center
      end


      pdf.text "Total: #{cartlist.valor}", style: :bold
      #pdf.text "Forma de Pagamento: #{cartlist.forma_de_pagamento == 1 ? 'A VISTA' : 'A PRAZO'}", style: :bold
      pdf.move_down 20
    end

    send_data(pdf.render,
    filename: "Relatório Vendas #{cartlists.first.data&.strftime('%d/%m/%Y')}.pdf",
    type: 'application/pdf')
  
  end
  

  private

  def produto_params
    params.require(:cartlist).permit(:cartlist_id)
  end
end
