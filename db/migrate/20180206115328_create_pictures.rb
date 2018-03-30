class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :comment
      t.string :piture
      t.integer :user_id

      t.timestamps
    end
  end
end
