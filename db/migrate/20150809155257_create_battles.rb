class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :win_ankle_id
      t.integer :lose_ankle_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
