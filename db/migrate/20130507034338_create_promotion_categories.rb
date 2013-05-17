class CreatePromotionCategories < ActiveRecord::Migration
  def change
    create_table :promotion_categories do |t|
      t.string :category_name

      t.timestamps
    end
    add_index :promotion_categories, :category_name, unique: true
  end
end
