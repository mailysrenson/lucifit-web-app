class CreateModalResponders < ActiveRecord::Migration[6.0]
  def change
    create_table :modal_responders do |t|

      t.timestamps
    end
  end
end
