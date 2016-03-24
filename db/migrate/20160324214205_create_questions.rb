class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :admin_id
      t.integer :category_id
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
