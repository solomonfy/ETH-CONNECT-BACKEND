class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :image
      t.integer :family_size
      t.string :address
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
