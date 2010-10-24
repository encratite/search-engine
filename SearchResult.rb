class SearchResult
	attr_reader :title, :description, :url
	
	def initialize(title, description, url)
		@title = title
		@description = description
		@url = url
	end
end
