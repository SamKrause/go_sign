ActiveAdmin.register CategoriesAnswer do

  permit_params :category_id, :answer_id

  form do |f|
    f.inputs "Details" do
      f.input :category, :as => :select, :collection => Category.all.collect {|category| [category.name, category.id] }
      f.input :answer, :as => :select, :collection => Answer.all.collect {|answer| [answer.name, answer.id] }
    end
    f.actions
  end

  index do
    id_column
    column :category_name do |category_answer|
      category_answer.category.name
    end
    column :answer do |category_answer|
      category_answer.name.answer
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |category_answer|
    attributes_table do
      row :category
      row :answer do
        category_answer.name.answer
      end
    end
  end


end
