class ChangeUrlToText < ActiveRecord::Migration[5.0]
  def change
    change_column :gank_items, :url, :text
  end
end
