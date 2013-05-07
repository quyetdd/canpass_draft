class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.integer :active_flg, default: 1
      t.integer :create_usr_id
      t.integer :update_usr_id

      t.timestamps
    end
    add_index :roles, :role_name, unique: true
  end
end
