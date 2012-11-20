class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name, :price, :category_id
end
