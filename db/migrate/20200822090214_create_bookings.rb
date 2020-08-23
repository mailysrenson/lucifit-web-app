class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user
      t.references :course
      t.integer :number_of_people
      t.timestamps
    end
  end
end
