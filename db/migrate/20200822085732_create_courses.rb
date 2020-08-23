class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :address
      t.date :date
      t.integer :number_of_places

      t.timestamps
    end
  end
end
