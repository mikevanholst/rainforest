class Review < ActiveRecord::Base
  attr_accessible :comment, :product_id, :user_id

  belongs_to :product
  belongs_to :user
  scope :newest_first, order("created_at DESC" )

end
