class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :src
      t.integer :event_id
      t.integer :member_id

      t.timestamps
    end
  end
end
