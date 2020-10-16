class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :host_id, foreign_key: true
      t.string :name
      t.text :description
      t.date :date
      t.string :location
      t.string :event_type
      t.string :event_card, default: 'https://ae01.alicdn.com/kf/HTB1afUPqHZnBKNjSZFrq6yRLFXar/100pcs-Exquisite-Invitation-Card-18th-Birthday-Party-Decorations-Greeting-Blessing-Card-Gift-Card-Party-Supplies.jpg_q50.jpg'
      t.text :summary

      t.timestamps
    end
  end
end
