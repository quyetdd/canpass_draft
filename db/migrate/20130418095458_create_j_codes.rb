class CreateJCodes < ActiveRecord::Migration
  def change
    create_table :j_codes do |t|

      t.timestamps
    end
  end
end
