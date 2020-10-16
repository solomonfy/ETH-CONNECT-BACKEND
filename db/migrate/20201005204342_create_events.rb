class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :host_id, foreign_key: true
      t.string :name
      t.text :description
      t.date :date
      t.string :location
      t.string :event_type
      t.string :event_card
      t.text :summary

      t.timestamps
    end
  end
end
