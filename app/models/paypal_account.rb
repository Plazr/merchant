class PaypalAccount < ActiveRecord::Base
  attr_accessible :login, :password, :signature
end
