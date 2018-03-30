class ChangeDefaultColumn < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:pictures, :comment, 'no comment')
  end
end
