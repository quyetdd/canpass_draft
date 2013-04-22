class CreateCampReports < ActiveRecord::Migration
  def change
    create_table :camp_reports do |t|

      t.timestamps
    end
  end
end
