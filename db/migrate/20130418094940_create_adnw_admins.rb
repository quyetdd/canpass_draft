class CreateAdnwAdmins < ActiveRecord::Migration
  def change
    create_table :adnw_admins do |t|

      t.timestamps
    end
  end
end
