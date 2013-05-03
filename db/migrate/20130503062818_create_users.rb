class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :email
      t.string :password_digest
      t.string :password_reset_token
      t.string :password_reset_sent_at
      t.datetime :last_login
      t.integer :role_id
      t.string :language
      t.integer :status
      t.string :password_flg

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
