class RenamePitureCulumnToPictures < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures,:piture,:picture
  end
end
