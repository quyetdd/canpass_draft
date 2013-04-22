class CreateApprovalTracks < ActiveRecord::Migration
  def change
    create_table :approval_tracks do |t|

      t.timestamps
    end
  end
end
