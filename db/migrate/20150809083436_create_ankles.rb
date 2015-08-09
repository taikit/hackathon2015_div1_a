class CreateAnkles < ActiveRecord::Migration
  def change
    create_table :ankles do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
