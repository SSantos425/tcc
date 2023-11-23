class CreateCartlists < ActiveRecord::Migration[7.0]
  def change
    create_table :cartlists do |t|
      t.float :valor
      t.timestamps
    end
  end
end
