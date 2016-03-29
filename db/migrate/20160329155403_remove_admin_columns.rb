class RemoveAdminColumns < ActiveRecord::Migration
  def change
    remove_column :categories, :admin_id, :integer
    remove_column :questions, :admin_id, :integer
    remove_column :answers, :admin_id, :string
  end
end
