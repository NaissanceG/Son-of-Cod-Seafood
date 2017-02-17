class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :origin
      t.string :species

      t.timestamps
    end
  end
end
