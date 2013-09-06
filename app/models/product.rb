class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents


  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}
  	
 


	def price
		# self.price_in_cents / 100
		price_in_cents / 100
	end
end