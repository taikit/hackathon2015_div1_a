class CreateAnkles < ActiveRecord::Migration
  def change
    create_table :ankles do |t|
      t.string :image
      t.integer :score
      t.integer :user_id
      t.boolean :is_avatar

      t.timestamps null: false
    end
  end
end
