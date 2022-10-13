class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
    @cart = current_user.cart
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      flash[:alert] = 'Address not saved !!'
      render :new
    end
  end

  def destroy
    address = Address.find_by(id: params[:id])
    address.destroy
    redirect_to addresses_path
  end

  def edit
    @address = Address.find_by(id: params[:id])
  end

  def update
    @address = Address.find_by(id: params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  def address_create
  end

  private 
  def address_params
    params.require(:address).permit(:line1, :line2, :landmark, :city, :state, :pincode)    
  end
end
