class CreateTestAttempts < ActiveRecord::Migration
  def change
    create_table :test_attempts do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
