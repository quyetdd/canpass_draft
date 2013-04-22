class CreateAfReports < ActiveRecord::Migration
  def change
    create_table :af_reports do |t|

      t.timestamps
    end
  end
end
