class CreateCategoriesAnswers < ActiveRecord::Migration
  def change
    create_table :categories_answers do |t|
      t.integer :category_id
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
