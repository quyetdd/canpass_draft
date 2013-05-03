namespace :master do
  desc "Create roles"
  task create_roles: :environment do
    Role.destroy_all
    Role.create!({id: 1, role_name: "Super", active_flg: 1}, without_production: true)
    Role.create!({id: 2, role_name: "Client", active_flg: 1}, without_production: true)
    Role.create!({id: 3, role_name: "Agency", active_flg: 1}, without_production: true)
  end
end
