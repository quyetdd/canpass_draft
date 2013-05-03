class Role < ActiveRecord::Base
  attr_accessible :active_flg, :role_name

  has_many :users
end
