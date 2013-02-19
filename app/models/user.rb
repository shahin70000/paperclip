class User < ActiveRecord::Base
  attr_accessible :description, :name, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	has_one :album, dependent: :destroy 
	accepts_nested_attributes_for :album
	has_many :photos, through: :album
	accepts_nested_attributes_for :photos

end
