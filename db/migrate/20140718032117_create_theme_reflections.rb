class CreateThemeReflections < ActiveRecord::Migration
  def change
    create_table :theme_reflections do |t|
      t.text :question
      t.integer :user_id

      t.timestamps
    end
  end
end
