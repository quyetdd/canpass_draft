class CreateAdnwMasters < ActiveRecord::Migration
  def change
    create_table :adnw_masters do |t|

      t.timestamps
    end
  end
end
