namespace :master do
  desc "Create roles"
  task create_roles: :environment do
    Role.destroy_all
    Role.create!({id: 1, role_name: "Super", active_flg: 1}, without_protection: true)
    Role.create!({id: 2, role_name: "Client", active_flg: 1}, without_protection: true)
    Role.create!({id: 3, role_name: "Agency", active_flg: 1}, without_protection: true)
  end
  
  desc "Create super user"
  task create_super_user: :environment do
    User.find_by_id(1).destroy if User.find_by_id(1)
    User.create!({id: 1, email: "example@septeni.com", username: "linhnt", password: "123456789", role_id: 1}, without_protection: true)
  end
end
