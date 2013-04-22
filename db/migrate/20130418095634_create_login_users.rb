class CreateLoginUsers < ActiveRecord::Migration
  def change
    create_table :login_users do |t|

      t.timestamps
    end
  end
end
