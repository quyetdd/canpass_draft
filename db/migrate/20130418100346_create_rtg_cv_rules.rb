class CreateRtgCvRules < ActiveRecord::Migration
  def change
    create_table :rtg_cv_rules do |t|

      t.timestamps
    end
  end
end
