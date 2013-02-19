class Album < ActiveRecord::Base
  attr_accessible :title, :user_id

	has_many :photos, dependent: :destroy 
	belongs_to :user

end
