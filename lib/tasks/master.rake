namespace :master do
  desc "Create role"
  task create_role: :environment do
    Role.destroy_all
    Role.create!({id: 1, role_name: "Super", active_flg: 1}, without_protection: true)
    Role.create!({id: 2, role_name: "Agency", active_flg: 1}, without_protection: true)
    Role.create!({id: 3, role_name: "Client", active_flg: 1}, without_protection: true)
  end
  
  desc "Create super user"
  task create_super_user: :environment do
    User.find_by_id(1).destroy if User.find_by_id(1)
    User.create!({id: 1, email: "example@septeni.com", username: "example", password: "123456789", role_id: 1, status: 1}, without_protection: true)
  end

  desc "Create promotion category"
  task create_promotion_category: :environment do
    PromotionCategory.destroy_all
    PromotionCategory.create!({id: 1, category_name: "Category 1"}, without_protection: true)
    PromotionCategory.create!({id: 2, category_name: "Category 2"}, without_protection: true)
    PromotionCategory.create!({id: 3, category_name: "Category 3"}, without_protection: true)
  end
end
