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
      t.integer :status
      t.string :password_flg

      t.timestamps
    end
  end
end
