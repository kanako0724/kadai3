class AddOptionPictures < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:pictures, :comment, ' ')
  end
end
