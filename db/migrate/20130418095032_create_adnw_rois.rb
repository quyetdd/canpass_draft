class CreateAdnwRois < ActiveRecord::Migration
  def change
    create_table :adnw_rois do |t|

      t.timestamps
    end
  end
end
