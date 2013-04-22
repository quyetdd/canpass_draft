class CreatePrompterInfos < ActiveRecord::Migration
  def change
    create_table :prompter_infos do |t|

      t.timestamps
    end
  end
end
