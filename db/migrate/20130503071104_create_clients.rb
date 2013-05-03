class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :clien_name
      t.string :romaji_name
      t.string :tel
      t.string :deparment_name
      t.integer :contract_flg
      t.integer :contract_type
      t.integer :del_flg
      t.integer :promotions_id

      t.timestamps
    end
  end
end
