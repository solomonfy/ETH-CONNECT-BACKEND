class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :image
      t.string :password_digest
      t.integer :family_size

      t.timestamps
    end
  end
end
