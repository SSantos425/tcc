Rails.application.routes.draw do
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

  #post 'adicionar_ao_estoque/:user_id/:produto_id/:quantity', to: 'inventorylists#adicionar_ao_estoque', as: 'adicionar_ao_estoque'
  post 'adicionar_ao_estoque', to: 'inventorylists#adicionar_ao_estoque', as: 'adicionar_ao_estoque'

  post 'adicionar_uma_venda', to: 'vendas#adicionar_uma_venda', as: 'adicionar_uma_venda'
  post 'vender', to: 'vendalists#vender', as: 'vender'
  root 'home_page#index'

  get "/home", to: "home_page#index"


  get 'cart', to: 'carts#show', as: 'cart'
  post 'add', to: 'carts#add', as: 'add'
  post 'remove', to: 'carts#remove', as: 'remove'
  post 'adicionar_ao_cartlist_prazo', to: 'carts#adicionar_ao_cartlist_prazo', as: 'adicionar_ao_cartlist_prazo'
  post 'adicionar_ao_cartlist_vista', to: 'carts#adicionar_ao_cartlist_vista', as: 'adicionar_ao_cartlist_vista'
  post 'empty_cart', to: 'carts#empty_cart', as: 'empty_cart'
  post 'dar_baixa_na_venda/:id', to:'cartlist_orderables#dar_baixa_na_venda', as:'dar_baixa_na_venda'
  get 'show/:id', to: 'cartlist_orderables#show', as: 'show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
