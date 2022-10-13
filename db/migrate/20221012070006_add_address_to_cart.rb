class AddAddressToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :address_id, :integer
  end
end
