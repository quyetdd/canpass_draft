class CreateBangs < ActiveRecord::Migration
  def change
    create_table :bangs do |t|

      t.timestamps
    end
  end
end
