class CreateSessionErrors < ActiveRecord::Migration
  def change
    create_table :session_errors do |t|

      t.timestamps
    end
  end
end
