class RenameTestattemptIdFromAttempts < ActiveRecord::Migration
  def change
    rename_column(:attempts, :testattempt_id, :test_attempt_id)
  end
end
