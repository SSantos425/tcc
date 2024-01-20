class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.float :valor
      t.float :desconto
      t.float :acrescimo
      t.date :data
      t.timestamps
    end
  end
end
