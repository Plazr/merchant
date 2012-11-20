class OrderTransaction < ActiveRecord::Base
  belongs_to :order
  attr_accessible :action, :amount, :authorization, :message, :params, :success
end
