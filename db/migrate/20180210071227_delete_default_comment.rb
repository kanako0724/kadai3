class DeleteDefaultComment < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:pictures, :comment, nil)
  end
end
