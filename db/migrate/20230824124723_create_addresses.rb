class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :order,         null: false, foreign_key: true
      t.string     :postal_code,      null: false
      t.integer    :shipping_origin_id, null: false
      t.string     :city,          null: false
      t.string     :street_address,         null: false
      t.string     :building_address
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
