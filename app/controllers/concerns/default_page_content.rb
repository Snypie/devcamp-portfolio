module DefaultPageContent
	extend ActiveSupport::Concern

	included do 
		before_action :set_page_defaults
	end
	def set_page_defaults
  		@page_title = "Preston's Portfolio Website"
  		@seo_keywords = "Preston Portfolio"
	end
end
