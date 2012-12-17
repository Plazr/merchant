class PaypalAccountsController < ApplicationController
  def new
    @paypal_account = PaypalAccount.new
  end
  
  def create
      @paypal_account = PaypalAccount.new(params[:paypal_account])
      @paypal_account.save
      redirect_to products_path    
  end
  
  def edit
  end
end
