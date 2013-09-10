class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :descriptor
      t.integer :product_id

      t.timestamps
    end
  end
end
