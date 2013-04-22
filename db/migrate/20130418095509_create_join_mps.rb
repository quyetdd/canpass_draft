class CreateJoinMps < ActiveRecord::Migration
  def change
    create_table :join_mps do |t|

      t.timestamps
    end
  end
end
