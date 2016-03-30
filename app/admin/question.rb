ActiveAdmin.register Question do

 permit_params :category_id, :answer_id, :name

   show do |question|
    attributes_table do
      row :id
      row :category
      row :name
      row :answer do
        if question.answer
          question.answer.name
        else
          "None"
        end
      end
      row :created_at
      row :updated_at
    end
  end


end
