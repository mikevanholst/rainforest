class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name, :first, :last, :gender, :avatar_url, :address, :admin
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
has_many :products, :through => :reviews
has_one :profile

after_initialize :init

def init
  self.admin = false  
end


end
