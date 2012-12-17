module OrdersHelper
  def gateway
    paypal_account = PaypalAccount.first
    
    @gateway ||= ActiveMerchant::Billing::PaypalExpressGateway.new(
      :login => paypal_account.login,
      :password => paypal_account.password,
      :signature => paypal_account.signature
    )
  end
end
