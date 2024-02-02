class CreateInventorylists < ActiveRecord::Migration[7.0]
  def change
    create_table :inventorylists do |t|
      t.references :user, foreign_key: true
      t.references :produto, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
