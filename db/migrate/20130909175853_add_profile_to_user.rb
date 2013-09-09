class AddProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :address, :text
    add_column :users, :gender, :string
    add_column :users, :avatar_url, :string
    add_column :users, :admin, :boolean
  end
end
