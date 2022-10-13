ActiveAdmin.register Category do
  permit_params :name, :image

  form :html => {:multipart => true } do |f|
    f.inputs do
      
      f.input :name
    end
    f.actions
  end 
end
