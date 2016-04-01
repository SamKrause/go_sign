class RemoveColumnFromAttemptAddColumnsToTestAttempts < ActiveRecord::Migration
  def change
    remove_column :attempts, :test_attempt_id, :integer
    add_column :test_attempts, :number_right, :integer
    add_column :test_attempts, :number_wrong, :integer
  end
end
