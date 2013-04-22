class CreateAdvMedia < ActiveRecord::Migration
  def change
    create_table :adv_media do |t|

      t.timestamps
    end
  end
end
