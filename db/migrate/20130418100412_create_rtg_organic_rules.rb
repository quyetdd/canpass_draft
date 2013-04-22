class CreateRtgOrganicRules < ActiveRecord::Migration
  def change
    create_table :rtg_organic_rules do |t|

      t.timestamps
    end
  end
end
