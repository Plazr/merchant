class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  attr_accessible :quantity, :unit_price, :product, :cart

  def full_price
  	unit_price * quantity
  end
end
