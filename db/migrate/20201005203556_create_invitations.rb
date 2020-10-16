class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :attendee_id, foreign_key: true
      t.integer :event_id, foreign_key: true
      t.string :message
      t.string :card, default: "https://cdn.cnn.com/cnnnext/dam/assets/190205150343-kitfo-full-169.jpg"
      t.timestamps
    end
  end
end
