class CreateOrderTransitions < ActiveRecord::Migration[4.2]
  def change
    create_table :order_transitions do |t|
      t.string :to_state, null: false
      t.text :metadata, default: "{}"
      t.integer :sort_key, null: false
      t.integer :order_id, null: false
      t.boolean :most_recent, null: false
      t.timestamps null: false
    end

    add_index(:order_transitions,
              [:order_id, :sort_key],
              unique: true,
              name: "index_order_transitions_parent_sort")
    add_index(:order_transitions,
              [:order_id, :most_recent],
              unique: true,
              where: 'most_recent',
              name: "index_order_transitions_parent_most_recent")
  end
end
