class ClientsUser < ActiveRecord::Base
  attr_accessible :client_id, :user_id
end
