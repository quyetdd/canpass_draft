class CreateAsps < ActiveRecord::Migration
  def change
    create_table :asps do |t|

      t.timestamps
    end
  end
end
