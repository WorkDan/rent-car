class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :plate_number, unique: true
      t.integer :seats_count, default: 4
      t.integer :large_bag_count, default: 1
      t.integer :small_bag_count, default: 1
      t.integer :doors_count, default: 4
      t.boolean :air_conditioning, default: true
      t.boolean :automatic_gearbox, default: true

      t.timestamps
    end
  end
end
