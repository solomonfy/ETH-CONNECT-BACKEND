class CreateAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :announcements do |t|
      t.string :description
      t.integer :member_id

      t.timestamps
    end
  end
end
