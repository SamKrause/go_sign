class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :testattempt_id
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
