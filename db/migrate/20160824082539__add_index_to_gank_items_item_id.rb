class AddIndexToGankItemsItemId < ActiveRecord::Migration[5.0]
  def change
    add_index :gank_items, :item_id, unique: true
  end
end
