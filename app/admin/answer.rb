ActiveAdmin.register Answer do

  form do |f|

    f.inputs do
        f.input :answer
        f.input :gif, :required => false, :as => :file

      f.has_many :question do |s|
        s.input :category
        s.input :name
        s.actions
      end
    end
    f.actions
  end

  index do
    id_column
    column :answer
    column :gif do |ad|
      image_tag(ad.gif.url(:thumb))
    end
    column :question_id
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
      row :question_id
    end
  end

end
