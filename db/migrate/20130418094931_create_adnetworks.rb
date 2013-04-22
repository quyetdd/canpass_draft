class CreateAdnetworks < ActiveRecord::Migration
  def change
    create_table :adnetworks do |t|

      t.timestamps
    end
  end
end
