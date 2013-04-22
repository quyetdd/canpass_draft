class CreateSessionLogs < ActiveRecord::Migration
  def change
    create_table :session_logs do |t|

      t.timestamps
    end
  end
end
