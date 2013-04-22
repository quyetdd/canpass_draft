class CreateAdvRois < ActiveRecord::Migration
  def change
    create_table :adv_rois do |t|

      t.timestamps
    end
  end
end
