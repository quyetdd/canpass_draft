class CreatePpcApiAccounts < ActiveRecord::Migration
  def change
    create_table :ppc_api_accounts do |t|

      t.timestamps
    end
  end
end
