class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user
      t.references :vehicle
      t.decimal    :price
      t.date    :start_date
      t.date    :end_date
      t.integer    :status

      t.timestamps
    end
  end
end
