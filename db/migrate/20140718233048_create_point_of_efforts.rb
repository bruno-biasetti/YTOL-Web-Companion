class CreatePointOfEfforts < ActiveRecord::Migration
  def change
    create_table :point_of_efforts do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
