class CreateAdnws < ActiveRecord::Migration
  def change
    create_table :adnws do |t|

      t.timestamps
    end
  end
end
