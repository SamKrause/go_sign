ActiveAdmin.register Question do

 permit_params :category_id, :answer_id, :name

 form do |f|
   f.inputs "Details" do
     f.input :category, :as => :select, :collection => Category.all.collect {|category| [category.name, category.id] }
     f.input :answer, :as => :select, :collection => Answer.all.collect {|answer| [answer.answer, answer.id] }
   end
   f.actions
 end


end
