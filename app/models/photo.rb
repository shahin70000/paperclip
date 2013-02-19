class Photo < ActiveRecord::Base
  attr_accessible :title, :image

	validates_attachment :image, 
		:presence => true, 
		:content_type => { :content_type =>  ['image/png', 'image/jpg'] },  
		:size => { :in => 0..10000.kilobytes }  

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
