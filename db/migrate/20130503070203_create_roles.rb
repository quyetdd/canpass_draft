class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
      t.integer :active_flg, default: 1

      t.timestamps
    end
    add_index :roles, :role_name, unique: true
  end
end
