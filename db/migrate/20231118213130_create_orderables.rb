class CreateOrderables < ActiveRecord::Migration[7.0]
  def change
    create_table :orderables do |t|
      t.references :user, foreign_key: true
      t.references :produto, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer :quantity
      
      
      
      

      t.timestamps
    end
  end
end
