class OrdersController < ApplicationController
  def index
		@orders = current_user.orders
	end

	def show
		@order = Order.find(params[:id])
		respond_to do |format|
		format.html
		format.json { render :json => @order }
  	end
	end
end
