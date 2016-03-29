ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :avatar

  index do
      id_column
      column :first_name
      column :last_name
      column :email
      column :created_at
      column :updated_at
      column :last_sign_in_at
      actions
    end

end
