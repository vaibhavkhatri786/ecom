ActiveAdmin.register Product do
  permit_params :name, :description, :price, :category_id, :pictures => []

  form :html => {:multipart => true } do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :description, as: :text
      f.input :price  
      f.input :pictures, as: :file, input_html: { :multiple => true }
      f.actions
    end
  end
  


  # index :as => :grid do |product|
  #   div do
  #     resource_selection_cell product
  #     #a :href => admin_product_path(product) do
  #       #static_or_uploaded_image_tag(product, [115, 115])
  #     #end
  #   end
  #   a truncate(product.name), :href => admin_product_path(product)
  # end



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
