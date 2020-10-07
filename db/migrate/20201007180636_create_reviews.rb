class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :attendee_id
      t.integer :event_id
      t.integer :likes

      t.timestamps
    end
  end
end
