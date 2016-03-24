class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.string :admin_id

      t.timestamps null: false
    end
  end
end
