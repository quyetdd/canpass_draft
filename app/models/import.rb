class Import < ActiveRecord::Base
  attr_accessible :csv
  has_attached_file :csv,
    path: ":rails_root/db/:basename.:extension",
    url: "db/:basename.:extension"
end
