# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create( name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
cliente1 = Cliente.create(nome:"samuel", cpf:"001.908.003-48")
cliente2 = Cliente.create(nome:"claudia", cpf:"001.908.444-48")
cliente3 = Cliente.create(nome:"clauduel", cpf:"001.908.555-48")

user = User.create(email:"admin@admin.com", password:123456)
wallet = Wallet.create(user_id:user.id, balance:0)

produto1 = Produto.create(nome: "ripa" ,  preco: 10 )
produto2 =Produto.create(nome: "sarrafo" ,  preco: 20 )
produto3 =Produto.create( nome: "ripa 4m" ,  preco: 30 )
produto4 =Produto.create( nome: "taxi-preto" ,  preco: 40 )


#estoque na verdade é a list de produtos no estoque
Inventorylist.create(user_id: user.id, produto_id: produto1.id, quantity:100)
Inventorylist.create(user_id: user.id, produto_id: produto2.id, quantity:100)
Inventorylist.create(user_id: user.id, produto_id: produto3.id, quantity:100)
Inventorylist.create(user_id: user.id, produto_id: produto4.id, quantity:100)
