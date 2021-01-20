class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :post_cord,        null: false
      t.integer  :delivery_area_id, null: false
      t.string   :municipalities,   null: false
      t.string   :address,          null: false
      t.string   :building
      t.string   :telephone,        null: false
      t.references :purchase,       foreign_key: true
      t.timestamps
    end
  end
end
