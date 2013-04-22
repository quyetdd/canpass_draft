class CreateAdvMenus < ActiveRecord::Migration
  def change
    create_table :adv_menus do |t|

      t.timestamps
    end
  end
end
