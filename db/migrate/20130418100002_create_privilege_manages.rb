class CreatePrivilegeManages < ActiveRecord::Migration
  def change
    create_table :privilege_manages do |t|

      t.timestamps
    end
  end
end
