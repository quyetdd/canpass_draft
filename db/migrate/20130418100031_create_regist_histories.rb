class CreateRegistHistories < ActiveRecord::Migration
  def change
    create_table :regist_histories do |t|

      t.timestamps
    end
  end
end
