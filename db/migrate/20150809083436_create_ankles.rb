class CreateAnkles < ActiveRecord::Migration
  def change
    create_table :ankles do |t|
      t.string :image
      t.integer :score, default: 1500
      t.integer :user_id
      t.boolean :is_avatar, default: true

      t.timestamps null: false
    end
  end
end
