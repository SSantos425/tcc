# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create( name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(email:"admin@admin.com", password:123456)
wallet = Wallet.create(user_id:user.id, balance:0)

produto = Produto.create(nome: "ripa" ,  preco: 10 )
Produto.create(nome: "sarrafo" ,  preco: 20 )
Produto.create( nome: "ripa 4m" ,  preco: 30 )
Produto.create( nome: "taxi-preto" ,  preco: 40 )


#estoque na verdade é a list de produtos no estoque
Inventorylist.create(user_id: user.id, produto_id: produto.id, quantity:10)
