class OrderTransactionsController < ApplicationController
  # GET /order_transactions
  # GET /order_transactions.json
  def index
    @order_transactions = OrderTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_transactions }
    end
  end

  # GET /order_transactions/1
  # GET /order_transactions/1.json
  def show
    @order_transaction = OrderTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_transaction }
    end
  end

  # GET /order_transactions/new
  # GET /order_transactions/new.json
  def new
    @order_transaction = OrderTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_transaction }
    end
  end

  # GET /order_transactions/1/edit
  def edit
    @order_transaction = OrderTransaction.find(params[:id])
  end

  # POST /order_transactions
  # POST /order_transactions.json
  def create
    @order_transaction = OrderTransaction.new(params[:order_transaction])

    respond_to do |format|
      if @order_transaction.save
        format.html { redirect_to @order_transaction, notice: 'Order transaction was successfully created.' }
        format.json { render json: @order_transaction, status: :created, location: @order_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @order_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_transactions/1
  # PUT /order_transactions/1.json
  def update
    @order_transaction = OrderTransaction.find(params[:id])

    respond_to do |format|
      if @order_transaction.update_attributes(params[:order_transaction])
        format.html { redirect_to @order_transaction, notice: 'Order transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_transactions/1
  # DELETE /order_transactions/1.json
  def destroy
    @order_transaction = OrderTransaction.find(params[:id])
    @order_transaction.destroy

    respond_to do |format|
      format.html { redirect_to order_transactions_url }
      format.json { head :no_content }
    end
  end
end
