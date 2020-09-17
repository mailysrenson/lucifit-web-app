class AddRemainingPlacesToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :remaining_places, :integer
  end
end
