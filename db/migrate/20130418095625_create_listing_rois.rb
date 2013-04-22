class CreateListingRois < ActiveRecord::Migration
  def change
    create_table :listing_rois do |t|

      t.timestamps
    end
  end
end
