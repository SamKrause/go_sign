ActiveAdmin.register Answer do

  permit_params :answer, :gif

  form do |f|
    f.inputs "Answer Details" do
      f.input :answer
      f.input :gif, :required => false, :as => :file
      # Will preview the image when the object is edited
    end
    f.actions
  end

  index do
    id_column
    column :answer
    column :gif do |ad|
      image_tag(ad.gif.url(:thumb))
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |ad|
    attributes_table do
      row :answer
      row :gif do
        image_tag(ad.gif.url(:thumb))
      end
      # Will display the image on show object page
    end
  end

end
