class Cart < ActiveRecord::Base
  has_many :line_items
  has_one :order

  attr_accessible :purchased_at

  def total_price
  	line_items.to_a.sum(&:full_price)
  end
end
