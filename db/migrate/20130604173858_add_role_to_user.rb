class AddRoleToUser < ActiveRecord::Migration
  def change
	add_column :users, :role, :string
	add_column :users, :postanonymous, :boolean
	change_column_default :users, :role, 'reader'
	change_column_default :users, :postanonymous, false
  end
end
