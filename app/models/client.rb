class Client < ActiveRecord::Base
  attr_accessible :client_name, :contract_flg, :contract_type, :del_flg, :department_name, :romaji_name, :tel

  has_many :client_users
end
