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
  accepts_nested_attributes_for :tags



  def update_tags(tag_list)
    tag_array = tag_list.downcase.split(",")
    tag_array.each do |tag|
      self.tags <<  Tag.find_or_create_by_descriptor(tag)
    end
  end  

  # def print_tags
  #   @products.tags.each {|tag|  "#{tag.descriptor}, "} 
  # end


end