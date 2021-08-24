class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :start_date
      t.integer :end_date
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :robot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
