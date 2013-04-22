class CreateRtgDomainGroups < ActiveRecord::Migration
  def change
    create_table :rtg_domain_groups do |t|

      t.timestamps
    end
  end
end
