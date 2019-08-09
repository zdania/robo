class CreateProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :long_description
      t.string :photo
      t.decimal :price
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
