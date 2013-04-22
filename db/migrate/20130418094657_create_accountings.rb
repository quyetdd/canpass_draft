class CreateAccountings < ActiveRecord::Migration
  def change
    create_table :accountings do |t|

      t.timestamps
    end
  end
end
