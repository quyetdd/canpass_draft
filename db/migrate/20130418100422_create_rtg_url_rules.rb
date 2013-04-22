class CreateRtgUrlRules < ActiveRecord::Migration
  def change
    create_table :rtg_url_rules do |t|

      t.timestamps
    end
  end
end
