class AddOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :phone
      t.text :name
      t.text :address
      t.text :items
    end
  end
end
