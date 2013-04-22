class CreateRetirePoints < ActiveRecord::Migration
  def change
    create_table :retire_points do |t|

      t.timestamps
    end
  end
end
