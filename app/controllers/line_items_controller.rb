class LineItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @line_item = LineItem.create(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
    flash[:notice] = "Added #{@product.name} to cart."
    redirect_to current_cart_path
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:notice] = "Successfully destroyed line item."
    redirect_to current_cart_path
  end
end
