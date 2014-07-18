class CreateSharings < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
      t.text :spiritual_life
      t.text :god_relationship
      t.text :family_relationship
      t.text :testimony_to_society
      t.integer :user_id

      t.timestamps
    end
  end
end
