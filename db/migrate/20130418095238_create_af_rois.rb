class CreateAfRois < ActiveRecord::Migration
  def change
    create_table :af_rois do |t|

      t.timestamps
    end
  end
end
