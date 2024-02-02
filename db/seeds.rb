# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create( name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


cliente1 = Cliente.create(nome:"CLIENTES DIVERSOS", tipo_cliente:"Pessoa Fisica") #0 P.FISICA
cliente2 = Cliente.create(nome:"AB CONSTRUÇÓES", tipo_cliente:"Pessoa Juridica") #1 P.JURIDICA


 
fornecedor1 = Fornecedor.create(nome:"ABRAMAX MADEIRAS",
cep:"68450-000",
endereco:"VIA MARGEM DIREITA DO RIO MOJU",
numero:0,
complento:"-",
bairro:"PARAISO",
cidade:"MOJU",
estado:"Pará",
fone:"91 99292-1254",
cnpj:"08.990.062/0001-08",
insc_estadual:"15.263.622-6",
razao_social:"ABRAMAX COMERCIO EXPORTAÇÃO DE MADEIRAS LTDA-EPP")

fornecedor2 = Fornecedor.create(nome:"MADEIREIRA NOVA ERA",
cep:"68450-000",
endereco:"Rua Agropalma",
numero:0,
complento:"CAIXA POSTAL 083, ESQUINA COM RUA ARAUARI",
bairro:"Altos",
cidade:"MOJU",
estado:"Pará",
fone:"91 99916-1022",
cnpj:"08.242.838/0001-01",
insc_estadual:"15.257.811-0",
razao_social:"NOVA ERA INDUSTRIA COMERCIO EXPORTAÇÃO DE MADEIRAS LIMITADA me")

compra1 = Compra.create(fornecedor_id: fornecedor1.id,
  numero_nota: "1130",
  serie: "1",
  data_emissao: Date.new(2023, 11, 20),
  data_recebimento: Date.new(2023, 11, 15),
  total_nota: 12564.32,
  total_produtos: 12564.35,
  desconto: 0.03,
  acrescimos: 0.0,
  imposto:0.0,
  frete: 7920,
  tipo:1
)

compra2 = Compra.create( fornecedor_id: fornecedor2.id,
  numero_nota: "3247",
  serie: "1",
  data_emissao: Date.new(2023, 11, 1),
  data_recebimento: Date.new(2023, 11, 15),
  total_nota: 57771.04,
  total_produtos: 57771.04,
  desconto: 0.0,
  acrescimos: 0.0,
  imposto:2579.54,
  frete: 12830.76,
  tipo:1
)


user = User.create(email:"admin@admin.com", password:123456)
wallet = Wallet.create(user_id:user.id, balance:0.0,data:Date.new(2023, 11, 1), reforco:0.0,caixa_status:0.0)

# VIGAS
produto1 = Produto.create(nome: "VIGA 8X18", unidade: "M", preco: 65, preco_compra: 27.46)

produto2 = Produto.create(nome: "VIGA 6X12 2,5M", unidade: "PCA", preco: 60, preco_compra: 42)
produto3 = Produto.create(nome: "VIGA 6X12 3,0M", unidade: "PCA", preco: 72, preco_compra: 50.40)
produto4 = Produto.create(nome: "VIGA 6X12 3,5M", unidade: "PCA", preco: 84, preco_compra: 58.80)
produto5 = Produto.create(nome: "VIGA 6X12 4,0M", unidade: "PCA", preco: 96, preco_compra: 67.20)
produto6 = Produto.create(nome: "VIGA 6X12 4,5M", unidade: "PCA", preco: 108, preco_compra: 75.60)
produto7 = Produto.create(nome: "VIGA 6X12 5,0M", unidade: "PCA", preco: 120, preco_compra: 84)
produto8 = Produto.create(nome: "VIGA 6X12 5,5M", unidade: "PCA", preco: 132, preco_compra: 92.40)
produto9 = Produto.create(nome: "VIGA 6X12 6,0M", unidade: "PCA", preco: 144, preco_compra: 100.80)
produto10 = Produto.create(nome: "VIGA 6X12 6,5M", unidade: "PCA", preco: 156, preco_compra: 109.20)
produto11 = Produto.create(nome: "VIGA 6X12 7,0M", unidade: "PCA", preco: 168, preco_compra: 117.60)
produto12 = Produto.create(nome: "VIGA 6X12 7,5M", unidade: "PCA", preco: 180, preco_compra: 126)
produto13 = Produto.create(nome: "VIGA 6X12 8,0M", unidade: "PCA", preco: 192, preco_compra: 134)
produto14 = Produto.create(nome: "VIGA 6X12 8,5M", unidade: "PCA", preco: 204, preco_compra: 0.0)
produto15 = Produto.create(nome: "VIGA 6X12 9,0M", unidade: "PCA", preco: 216, preco_compra: 0.0)
produto16 = Produto.create(nome: "VIGA 6X12 9,5M", unidade: "PCA", preco: 228, preco_compra: 0.0)

# CAIBRO
produto0 = Produto.create(nome: "CAIBRO 1,0M - CACHORRO", unidade: "PCA", preco: 7, preco_compra: 5)

produto17 = Produto.create(nome: "CAIBRO 3,5X6 2,5M", unidade: "PCA", preco: 17.50, preco_compra: 12.25)
produto18 = Produto.create(nome: "CAIBRO 3,5X6 3,0M", unidade: "PCA", preco: 21, preco_compra: 14.70)
produto19 = Produto.create(nome: "CAIBRO 3,5X6 3,5M", unidade: "PCA", preco: 24.50, preco_compra: 17.15)
produto20 = Produto.create(nome: "CAIBRO 3,5X6 4,0M", unidade: "PCA", preco: 28, preco_compra: 19.60)
produto21 = Produto.create(nome: "CAIBRO 3,5X6 4,5M", unidade: "PCA", preco: 31.50, preco_compra: 22.05)
produto22 = Produto.create(nome: "CAIBRO 3,5X6 5,0M", unidade: "PCA", preco: 35, preco_compra: 24.50)
produto23 = Produto.create(nome: "CAIBRO 3,5X6 5,5M", unidade: "PCA", preco: 38.50, preco_compra: 26.95)
produto24 = Produto.create(nome: "CAIBRO 3,5X6 6,0M", unidade: "PCA", preco: 42, preco_compra: 29.40)
produto25 = Produto.create(nome: "CAIBRO 3,5X6 6,5M", unidade: "PCA", preco: 45.50, preco_compra: 31.45)
produto26 = Produto.create(nome: "CAIBRO 3,5X6 7,0M", unidade: "PCA", preco: 49, preco_compra: 34.30)
produto27 = Produto.create(nome: "CAIBRO 3,5X6 7,5M", unidade: "PCA", preco: 52.50, preco_compra: 36.75)
produto28 = Produto.create(nome: "CAIBRO 3,5X6 8,0M", unidade: "PCA", preco: 56, preco_compra: 0.0)
produto29 = Produto.create(nome: "CAIBRO 3,5X6 8,5M", unidade: "PCA", preco: 59.50, preco_compra: 0.0)

# FRECHAL
produto30 = Produto.create(nome: "FRECHAL 6X6", unidade: "M", preco: 12, preco_compra: 8.40)

# RIPA
produto31 = Produto.create(nome: "RIPA 1,2X5", unidade: "DZ", preco: 80, preco_compra: 48)


#estoque na verdade é a list de produtos no estoque
user = User.find_by(id: 1)  # Substitua 1 pelo ID do usuário desejado

# VIGAS
Inventorylist.create(user_id: user.id, produto_id: produto1.id, quantity: 0.0) #SEM ESTOQUE

Inventorylist.create(user_id: user.id, produto_id: produto2.id, quantity: 32)
Inventorylist.create(user_id: user.id, produto_id: produto3.id, quantity: 41)
Inventorylist.create(user_id: user.id, produto_id: produto4.id, quantity: 71)
Inventorylist.create(user_id: user.id, produto_id: produto5.id, quantity: 55)
Inventorylist.create(user_id: user.id, produto_id: produto6.id, quantity: 37)
Inventorylist.create(user_id: user.id, produto_id: produto7.id, quantity: 49)
Inventorylist.create(user_id: user.id, produto_id: produto8.id, quantity: 27)
Inventorylist.create(user_id: user.id, produto_id: produto9.id, quantity: 25)
Inventorylist.create(user_id: user.id, produto_id: produto10.id, quantity: 25)
Inventorylist.create(user_id: user.id, produto_id: produto11.id, quantity: 20)
Inventorylist.create(user_id: user.id, produto_id: produto12.id, quantity: 11)
Inventorylist.create(user_id: user.id, produto_id: produto13.id, quantity: 12)
Inventorylist.create(user_id: user.id, produto_id: produto14.id, quantity: 5)
Inventorylist.create(user_id: user.id, produto_id: produto15.id, quantity: 9)
Inventorylist.create(user_id: user.id, produto_id: produto16.id, quantity: 0.0) #SEM ESTOQUE

Inventorylist.create(user_id: user.id, produto_id: produto0.id, quantity: 0.0) #SEM ESTOQUE

Inventorylist.create(user_id: user.id, produto_id: produto17.id, quantity: 180)
Inventorylist.create(user_id: user.id, produto_id: produto18.id, quantity: 632)
Inventorylist.create(user_id: user.id, produto_id: produto19.id, quantity: 398)
Inventorylist.create(user_id: user.id, produto_id: produto20.id, quantity: 601)
Inventorylist.create(user_id: user.id, produto_id: produto21.id, quantity: 544)
Inventorylist.create(user_id: user.id, produto_id: produto22.id, quantity: 295)
Inventorylist.create(user_id: user.id, produto_id: produto23.id, quantity: 219)
Inventorylist.create(user_id: user.id, produto_id: produto24.id, quantity: 49)
Inventorylist.create(user_id: user.id, produto_id: produto25.id, quantity: 0.0)
Inventorylist.create(user_id: user.id, produto_id: produto26.id, quantity: 85)
Inventorylist.create(user_id: user.id, produto_id: produto27.id, quantity: 32)
Inventorylist.create(user_id: user.id, produto_id: produto28.id, quantity: 29)

Inventorylist.create(user_id: user.id, produto_id: produto29.id, quantity: 0.0)
Inventorylist.create(user_id: user.id, produto_id: produto30.id, quantity: 2691)
Inventorylist.create(user_id: user.id, produto_id: produto31.id, quantity: 1680)

puts("Seed Completo!")