class CreateEventsummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :eventsummaries do |t|
      t.string :description
      t.string :image
      t.integer :event_id
      t.integer :member_id

      t.timestamps
    end
  end
end
