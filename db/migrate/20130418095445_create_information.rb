class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|

      t.timestamps
    end
  end
end
