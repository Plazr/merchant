class Order < ActiveRecord::Base
  include OrdersHelper
    
  belongs_to :cart
  has_many :transactions, :class_name => "OrderTransaction"
  attr_accessible :card_expires_on, :card_type, :first_name, :ip_address, :last_name, 
                  :card_number, :card_verification, :express_token, :express_payer_id

  def purchase
  	response = gateway.purchase(price_in_cents, express_purchase_options)
  	transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
  	cart.update_attribute(:purchased_at, Time.now) if response.success?
  	response.success?
  end

  def price_in_cents
  	(cart.total_price*100).round
  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      details = gateway.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
    end
  end
  
  def express_purchase_options
    {
      :ip => ip_address,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end
  
end