ActiveAdmin.register Answer do

  permit_params :answer, :gif, :question_id

  form do |f|
    f.inputs "Answer Details" do
      f.input :answer
      f.input :gif, :required => false, :as => :file
      f.input :question, :as => :select, :collection => Question.all.collect {|question| [question.name, question.id] }
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
      # Will display the image on show object page
    end
  end

end
