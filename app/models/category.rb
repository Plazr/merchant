class Category < ActiveRecord::Base
	has_many :products

  attr_accessible :name

  def to_s
  	self.name
  end
end
