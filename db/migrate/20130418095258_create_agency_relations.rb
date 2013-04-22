class CreateAgencyRelations < ActiveRecord::Migration
  def change
    create_table :agency_relations do |t|

      t.timestamps
    end
  end
end
