class HomeController < ApplicationController
  def index
    @products = Product.all.with_attached_pictures
    respond_to do |format|
      format.html
      format.json { render :json => @products.to_json }
    end
  end
  def show
    @product = Product.find_by(id: params[:id])
  end
end
