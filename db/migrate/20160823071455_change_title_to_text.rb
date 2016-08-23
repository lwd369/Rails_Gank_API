class ChangeTitleToText < ActiveRecord::Migration[5.0]
  def change
    change_column :gank_items, :title, :text
  end
end
