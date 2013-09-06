class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents

	def price
		# self.price_in_cents / 100
		price_in_cents / 100
	end
end