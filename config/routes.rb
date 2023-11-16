Rails.application.routes.draw do
  devise_for :users
  resources :produtos
  resources :inventorylists #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :vendas #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS
  resources :vendalists #COLOCAR O ONLY AQUI PRA NAO FICAR UMAS ROTAS AVULSAS

  #post 'adicionar_ao_estoque/:user_id/:produto_id/:quantity', to: 'inventorylists#adicionar_ao_estoque', as: 'adicionar_ao_estoque'
  post 'adicionar_ao_estoque', to: 'inventorylists#adicionar_ao_estoque', as: 'adicionar_ao_estoque'

  post 'adicionar_uma_venda', to: 'vendas#adicionar_uma_venda', as: 'adicionar_uma_venda'
  post 'vender', to: 'vendalists#vender', as: 'vender'
  root 'home_page#index'

  get "/home", to: "home_page#index"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
