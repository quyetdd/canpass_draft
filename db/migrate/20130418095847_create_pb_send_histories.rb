class CreatePbSendHistories < ActiveRecord::Migration
  def change
    create_table :pb_send_histories do |t|

      t.timestamps
    end
  end
end
