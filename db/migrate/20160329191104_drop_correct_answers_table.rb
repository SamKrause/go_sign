class DropCorrectAnswersTable < ActiveRecord::Migration
  def change
    drop_table :correct_answers
  end
end
