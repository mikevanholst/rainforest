class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents, :category_id


  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}
  	
 

	def price
		# self.price_in_cents / 100
		price_in_cents / 100
	end

  has_and_belongs_to_many :tags
  belongs_to :category
  has_many :reviews
  has_many :users, :through => :reviews
end