class Tag < ActiveRecord::Base
  attr_accessible :descriptor, :product_id

    has_and_belongs_to_many :products 
end
