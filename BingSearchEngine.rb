require_relative 'SearchEngine'

class BingSearchEngine < SearchEngine
	def initialize
		super
		@pattern = /<h3><a href="(.+?)" .+?>(.+?)<\/a><\/h3>.+?<p>(.+?)<\/p>/
		@cookies =
		{
			'_FS' => 'mkt=en-US',
			'ui' => '#en-US',
			'smkt' => 'en-US',
		}
	end
	
	def getURL(term)
		return "http://www.bing.com/search?q=#{term}&go=&form=QBLH&qs=n&sk="
	end
end
