class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :host_id, foreign_key: true
      t.integer :attendee_id, foreign_key: true
      t.integer :event_id, foreign_key: true
      t.timestamps
    end
  end
end
