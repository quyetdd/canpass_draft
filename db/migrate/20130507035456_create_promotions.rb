class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :promotion_name
      t.integer :promotion_category_id
      t.integer :client_id
      t.integer :status
      t.integer :del_flg, default: 1
      t.integer :create_usr_id
      t.integer :update_usr_id

      t.timestamps
    end
    add_index :promotions, :promotion_name
  end
end
