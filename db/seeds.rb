# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create( name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
cliente1 = Cliente.create(nome:"CLIENTES ADVERSOS", cpf:"-")
cliente2 = Cliente.create(nome:"AB CONSTRUÇÓES", cpf:"-")

fornecedor1 = Fornecedor.create(nome:"SAMUEL",endereco:"-",cnpj:"-",insc_estadual:"-")
fornecedor2 = Fornecedor.create(nome:"ANTONIO",endereco:"-",cnpj:"-",insc_estadual:"-")

compra1 = Compra.create(fornecedor_id: fornecedor1.id,
  numero_nota: "1130",
  serie: "1",
  data_emissao: "13/12/2023",
  data_recebimento: "16/12/2023",
  total_nota: 12564.32,
  total_produtos: 12564.35,
  desconto: 0.03,
  acrescimos: 0,
  frete: 7920
)

compra2 = Compra.create( fornecedor_id: fornecedor2.id,
  numero_nota: "3247",
  serie: "1",
  data_emissao: "10/11/2023",
  data_recebimento: "17/11/2023",
  total_nota: 14347.91,
  total_produtos: 14347.92,
  desconto: 0.01,
  acrescimos: 0,
  frete: 12830.76
)


user = User.create(email:"admin@admin.com", password:123456)
wallet = Wallet.create(user_id:user.id, balance:0)

# VIGAS
produto1 = Produto.create(nome: "VIGA 8X18 2,5M", unidade: "ML", preco: 65)
produto2 = Produto.create(nome: "VIGA 6X12 2,5M", unidade: "PCA", preco: 60)
produto3 = Produto.create(nome: "VIGA 6X12 3,0M", unidade: "PCA", preco: 72)
produto4 = Produto.create(nome: "VIGA 6X12 3,5M", unidade: "PCA", preco: 84)
produto5 = Produto.create(nome: "VIGA 6X12 4,0M", unidade: "PCA", preco: 96)
produto6 = Produto.create(nome: "VIGA 6X12 4,5M", unidade: "PCA", preco: 108)
produto7 = Produto.create(nome: "VIGA 6X12 5,0M", unidade: "PCA", preco: 120)
produto8 = Produto.create(nome: "VIGA 6X12 5,5M", unidade: "PCA", preco: 132)
produto9 = Produto.create(nome: "VIGA 6X12 6,0M", unidade: "PCA", preco: 144)
produto10 = Produto.create(nome: "VIGA 6X12 6,5M", unidade: "PCA", preco: 156)
produto11 = Produto.create(nome: "VIGA 6X12 7,0M", unidade: "PCA", preco: 168)
produto12 = Produto.create(nome: "VIGA 6X12 7,5M", unidade: "PCA", preco: 180)
produto13 = Produto.create(nome: "VIGA 6X12 8,0M", unidade: "PCA", preco: 192)
produto14 = Produto.create(nome: "VIGA 6X12 8,5M", unidade: "PCA", preco: 204)
produto15 = Produto.create(nome: "VIGA 6X12 9,0M", unidade: "PCA", preco: 216)
produto16 = Produto.create(nome: "VIGA 6X12 9,5M", unidade: "PCA", preco: 228)

# CAIBRO
produto0 = Produto.create(nome: "CAIBRO 1,0M - CACHORRO", unidade: "PCA", preco: 7)
produto17 = Produto.create(nome: "CAIBRO 3,5X6 2,5M", unidade: "PCA", preco: 17.50)
produto18 = Produto.create(nome: "CAIBRO 3,5X6 3,0M", unidade: "PCA", preco: 21)
produto19 = Produto.create(nome: "CAIBRO 3,5X6 3,5M", unidade: "PCA", preco: 24.50)
produto20 = Produto.create(nome: "CAIBRO 3,5X6 4,0M", unidade: "PCA", preco: 28)
produto21 = Produto.create(nome: "CAIBRO 3,5X6 4,5M", unidade: "PCA", preco: 31.50)
produto22 = Produto.create(nome: "CAIBRO 3,5X6 5,0M", unidade: "PCA", preco: 35)
produto23 = Produto.create(nome: "CAIBRO 3,5X6 5,5M", unidade: "PCA", preco: 38.50)
produto24 = Produto.create(nome: "CAIBRO 3,5X6 6,0M", unidade: "PCA", preco: 42)
produto25 = Produto.create(nome: "CAIBRO 3,5X6 6,5M", unidade: "PCA", preco: 45.50)
produto26 = Produto.create(nome: "CAIBRO 3,5X6 7,0M", unidade: "PCA", preco: 49)
produto27 = Produto.create(nome: "CAIBRO 3,5X6 7,5M", unidade: "PCA", preco: 52.50)
produto28 = Produto.create(nome: "CAIBRO 3,5X6 8,0M", unidade: "PCA", preco: 56)
produto29 = Produto.create(nome: "CAIBRO 3,5X6 8,5M", unidade: "PCA", preco: 59.50)

# FRECHAL
produto30 = Produto.create(nome: "CAIBRO 6X6", unidade: "M", preco: 12)

# RIPA
produto31 = Produto.create(nome: "RIPA 1,2X5", unidade: "DZ", preco: 12)

#estoque na verdade é a list de produtos no estoque
Inventorylist.create(user_id: user.id, produto_id: produto17.id, quantity:300)
Inventorylist.create(user_id: user.id, produto_id: produto18.id, quantity:60)
Inventorylist.create(user_id: user.id, produto_id: produto19.id, quantity:150)

Inventorylist.create(user_id: user.id, produto_id: produto21.id, quantity:40)
Inventorylist.create(user_id: user.id, produto_id: produto22.id, quantity:208)
Inventorylist.create(user_id: user.id, produto_id: produto23.id, quantity:290)
Inventorylist.create(user_id: user.id, produto_id: produto24.id, quantity:102)
Inventorylist.create(user_id: user.id, produto_id: produto25.id, quantity:23)
Inventorylist.create(user_id: user.id, produto_id: produto26.id, quantity:34)
Inventorylist.create(user_id: user.id, produto_id: produto27.id, quantity:8)

Inventorylist.create(user_id: user.id, produto_id: produto30.id, quantity:420)
Inventorylist.create(user_id: user.id, produto_id: produto31.id, quantity:70)
Inventorylist.create(user_id: user.id, produto_id: produto1.id, quantity:85)
Inventorylist.create(user_id: user.id, produto_id: produto2.id, quantity:24)
Inventorylist.create(user_id: user.id, produto_id: produto3.id, quantity:40)
Inventorylist.create(user_id: user.id, produto_id: produto4.id, quantity:13)
Inventorylist.create(user_id: user.id, produto_id: produto5.id, quantity:2)
Inventorylist.create(user_id: user.id, produto_id: produto6.id, quantity:3)
Inventorylist.create(user_id: user.id, produto_id: produto7.id, quantity:11)
Inventorylist.create(user_id: user.id, produto_id: produto8.id, quantity:12)
Inventorylist.create(user_id: user.id, produto_id: produto9.id, quantity:5)




puts("Seed Completo!")