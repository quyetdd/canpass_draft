class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :romaji_name
      t.string :tel
      t.string :department_name
      t.integer :contract_flg
      t.integer :contract_type
      t.integer :del_flg

      t.timestamps
    end
  end
end
