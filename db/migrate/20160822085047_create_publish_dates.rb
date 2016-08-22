class CreatePublishDates < ActiveRecord::Migration[5.0]
  def change
    create_table :publish_dates do |t|
      t.datetime :publish_date, unique: true

      t.timestamps
    end
  end
end
