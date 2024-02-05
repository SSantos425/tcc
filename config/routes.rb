Rails.application.routes.draw do
  get 'compras/index'
  get 'compras/new'
  get 'fornecedores/index'
  devise_for :users
  resources :produtos
  resources :inventorylists #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :vendas #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :vendalists #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :cartlist #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :cartlist_orderables #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :fornecedores #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :clientes #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :wallets #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :compras #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :list_wallets #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS

  #post 'adicionar_ao_estoque/:user_id/:produto_id/:quantity', to: 'inventorylists#adicionar_ao_estoque', as: 'adicionar_ao_estoque'
  post 'adicionar_ao_estoque', to: 'inventorylists#adicionar_ao_estoque', as: 'adicionar_ao_estoque'

  post 'adicionar_uma_venda', to: 'vendas#adicionar_uma_venda', as: 'adicionar_uma_venda'
  post 'vender', to: 'vendalists#vender', as: 'vender'
  root 'wallets#new'

  get "/home", to: "home_page#index"

  post 'cep', to: 'clientes#cep', as: 'cep'

  get 'cart', to: 'carts#show', as: 'cart'
  post 'add', to: 'carts#add', as: 'add'
  post 'remove', to: 'carts#remove', as: 'remove'


  get 'listaprodutos', to: 'produtos#listaprodutos', as: 'listaprodutos'

  post 'incluir_produtos', to: 'compras#incluir_produtos', as: 'incluir_produtos'

  post 'reforco_caixa', to: 'list_wallets#reforco_caixa', as: 'reforco_caixa'
  post 'retirar_caixa', to: 'list_wallets#retirar_caixa', as: 'retirar_caixa'
  post 'fechar_caixa', to: 'list_wallets#fechar_caixa', as: 'fechar_caixa'

  post 'comprar', to: 'compras#comprar', as: 'comprar'

  post 'remover_item_listcompra', to: 'compras#remover_item_listcompra', as: 'remover_item_listcompra'
  post 'atualizar_item_listcompra', to: 'compras#atualizar_item_listcompra', as: 'atualizar_item_listcompra'
  
  get '/compras_cliente/:cliente_id', to: 'compras#compras_cliente', as: 'compras_cliente'


  post 'aplicar_desconto', to: 'carts#aplicar_desconto', as: 'aplicar_desconto'
  post 'aplicar_acrescimo', to: 'carts#aplicar_acrescimo', as: 'aplicar_acrescimo'
  post 'data', to: 'carts#data', as: 'data'
  post 'caixa_data', to: 'wallets#caixa_data', as: 'caixa_data'
  post 'adicionar_ao_cartlist_prazo', to: 'carts#adicionar_ao_cartlist_prazo', as: 'adicionar_ao_cartlist_prazo'
  post 'adicionar_ao_cartlist_vista', to: 'carts#adicionar_ao_cartlist_vista', as: 'adicionar_ao_cartlist_vista'
  post 'empty_cart', to: 'carts#empty_cart', as: 'empty_cart'
  post 'dar_baixa_na_venda/:id', to:'cartlist_orderables#dar_baixa_na_venda', as:'dar_baixa_na_venda'
  get 'show/:id', to: 'cartlist_orderables#show', as: 'show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
