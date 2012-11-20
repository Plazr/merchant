class Order < ActiveRecord::Base
  belongs_to :cart
  attr_accessible :card_expires_on, :card_type, :first_name, :ip_address, :last_name
end
