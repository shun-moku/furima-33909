class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :zip_code,   null: false
      t.integer    :region_id,    null: false
      t.string     :city
      t.string     :street_number
      t.string     :building
      t.string     :phone_number
      t.references :order,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
