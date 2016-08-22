class CreateGankItems < ActiveRecord::Migration[5.0]
  def change
    create_table :gank_items do |t|
      t.string :item_id
      t.string :title
      t.string :source
      t.string :url
      t.string :who
      t.datetime :published_date
      t.references :gank_type, foreign_key: true

      t.timestamps
    end
    add_index :gank_items, :published_date
  end
end
