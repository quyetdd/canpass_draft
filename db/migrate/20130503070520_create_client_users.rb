class CreateClientUsers < ActiveRecord::Migration
  def change
    create_table :client_users do |t|
      t.integer :client_id
      t.integer :user_id
      t.integer :del_flg, default: 1

      t.timestamps
    end
  end
end
