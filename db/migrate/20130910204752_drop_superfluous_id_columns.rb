class DropSuperfluousIdColumns < ActiveRecord::Migration
 def change
    remove_column :products, :tag_id, :integer
    remove_column :tags, :product_id, :integer
  end
end
 