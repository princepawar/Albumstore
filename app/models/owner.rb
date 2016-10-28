class Owner < ActiveRecord::Base
  has_many :articles
end
