class CreateRtgs < ActiveRecord::Migration
  def change
    create_table :rtgs do |t|

      t.timestamps
    end
  end
end
