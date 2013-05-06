class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname
      t.string :password_digest
      t.string :email
      t.integer :role_id
      t.datetime :last_login
      t.string :language
      t.integer :status, default: 1
      t.integer :password_flg

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
