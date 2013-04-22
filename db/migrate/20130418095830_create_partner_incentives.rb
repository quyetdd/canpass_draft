class CreatePartnerIncentives < ActiveRecord::Migration
  def change
    create_table :partner_incentives do |t|

      t.timestamps
    end
  end
end
