class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.python
		where(subtitle: 'Python')
end

scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

after_initialize :set_defaults

def set_defaults
	self.main_image ||= "http://via.placeholder.com/600x400"
	self.thumb_image ||= "http://via.placeholder.com/400x350"
	end
end

#if self.main_image == nill
#self.main_image = "http"
#end