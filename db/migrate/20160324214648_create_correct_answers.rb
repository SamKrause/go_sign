class CreateCorrectAnswers < ActiveRecord::Migration
  def change
    create_table :correct_answers do |t|
      t.integer :answer_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
