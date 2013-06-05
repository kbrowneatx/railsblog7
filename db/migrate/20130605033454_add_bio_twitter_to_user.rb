class AddBioTwitterToUser < ActiveRecord::Migration
  def change
  	add_column :users, :bio, :text
  	add_column :users, :twitter, :string
  end
end
