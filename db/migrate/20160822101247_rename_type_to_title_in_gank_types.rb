class RenameTypeToTitleInGankTypes < ActiveRecord::Migration[5.0]
  def change
    rename_column :gank_types, :type, :title
  end
end
