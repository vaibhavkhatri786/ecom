class CartsController < AuthenticationController
  before_action :set_cart
  before_action :set_total

  def show
		@cart = Cart.find(params[:id])
		@addresses = current_user.addresses
	end

	def update
		cart = current_user.cart
		if cart.update(cart_params)
			set_order
		else
			flash[:error] = "Something wrong !!"
		end
	end

	def add_item_to_cart
		@cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id])
		if @cart_item.save
			flash[:notice] = "Item added into cart."
			redirect_to cart_path(@cart)
		else
			flash[:notice] = "Unable to add item into cart. Please try again"
			redirect_to root_path
		end
	end

	def destroy_item
		cart_item = @cart.cart_items.find_by(id: params[:id])
		cart_item.destroy
		redirect_to cart_path(@cart)
	end

	def increament_item
		@cart_item = @cart.cart_items.find_by(id: params[:id])
		@cart_item.quantity += 1
		@cart_item.save
		redirect_to cart_path(@cart)
	end

	def decreament_item
		@cart_item = @cart.cart_items.find_by(id: params[:id])
		if @cart_item.quantity <= 1 
    	@cart_item.destroy
    else
			@cart_item.quantity -=1
			@cart_item.save
    end
		redirect_to cart_path(@cart)
	end
 	
	private
  def cart_params
    params.require(:cart).permit(:address_id)
  end

  def set_cart
    @cart = current_user.cart.present? ? current_user.cart : current_user.create_cart
  end
  
	def set_total
		current_user.cart.total_price = current_user.cart.sub_total
		current_user.cart.save
	end

	def set_order
		@order = current_user.orders.create
  	@order.total_price = current_user.cart.total_price
		@order.address_id = current_user.cart.address_id
		@order.save
		set_order_items
	end

	def set_order_items
		current_user.cart.cart_items.each do |cart_item|
			@order.order_items.create!(product_id: cart_item.product_id, quantity: cart_item.quantity)
		end
		clear_cart
	end

	def clear_cart
		current_user.cart.destroy
		current_user.create_cart!
	end
end
