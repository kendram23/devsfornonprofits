class AddCompanyNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_name,     :string
  	add_column :users, :first_name,       :string
  	add_column :users, :last_name,        :string
  	add_column :users, :github_profile,   :string
  	add_column :users, :linkedin_profile, :string
  	add_column :users, :twitter_profile,  :string
  	add_column :users, :resume,           :string
  	add_column :users, :picture_url,      :string
  	add_column :users, :about,            :string
  	add_column :users, :address,          :string
  	add_column :users, :city,             :string
  	add_column :users, :state,            :string
  	add_column :users, :zipcode,          :string
  	add_column :users, :phone,            :string
  end
end
