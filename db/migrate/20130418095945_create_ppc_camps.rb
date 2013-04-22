class CreatePpcCamps < ActiveRecord::Migration
  def change
    create_table :ppc_camps do |t|

      t.timestamps
    end
  end
end
