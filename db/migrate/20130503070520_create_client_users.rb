class CreateClientUsers < ActiveRecord::Migration
  def change
    create_table :client_users do |t|
      t.integer :client_id
      t.integer :user_id

      t.timestamps
    end
  end
end
