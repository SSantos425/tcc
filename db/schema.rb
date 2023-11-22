# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_21_013614) do
  create_table "cartlist_orderables", force: :cascade do |t|
    t.integer "user_id"
    t.integer "produto_id"
    t.integer "cartlist_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cartlist_id"], name: "index_cartlist_orderables_on_cartlist_id"
    t.index ["produto_id"], name: "index_cartlist_orderables_on_produto_id"
    t.index ["user_id"], name: "index_cartlist_orderables_on_user_id"
  end

  create_table "cartlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventorylists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "produto_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_inventorylists_on_produto_id"
    t.index ["user_id"], name: "index_inventorylists_on_user_id"
  end

  create_table "orderables", force: :cascade do |t|
    t.integer "user_id"
    t.integer "produto_id"
    t.integer "cart_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_orderables_on_cart_id"
    t.index ["produto_id"], name: "index_orderables_on_produto_id"
    t.index ["user_id"], name: "index_orderables_on_user_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.float "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendas", force: :cascade do |t|
    t.integer "user_id"
    t.integer "produto_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_vendas_on_produto_id"
    t.index ["user_id"], name: "index_vendas_on_user_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "cartlist_orderables", "cartlists"
  add_foreign_key "cartlist_orderables", "produtos"
  add_foreign_key "cartlist_orderables", "users"
  add_foreign_key "inventorylists", "produtos"
  add_foreign_key "inventorylists", "users"
  add_foreign_key "orderables", "carts"
  add_foreign_key "orderables", "produtos"
  add_foreign_key "orderables", "users"
  add_foreign_key "vendas", "produtos"
  add_foreign_key "vendas", "users"
  add_foreign_key "wallets", "users"
end
