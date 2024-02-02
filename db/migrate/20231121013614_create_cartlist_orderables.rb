class CreateCartlistOrderables < ActiveRecord::Migration[7.0]
  def change
    create_table :cartlist_orderables do |t|
      t.references :user, foreign_key: true
      t.references :produto, foreign_key: true
      t.references :cartlist, foreign_key: true
      t.references :cliente,foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
