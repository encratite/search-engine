require 'cgi'
require 'htmlentities'

require 'nil/http'

require_relative 'SearchEngine'
require_relative 'SearchResult'

class SearchEngine
	def initialize
		@cookies = {}
		@fieldOrder = [:url, :title, :description]
	end
	
	def getField(input, symbol)
		offset = @fieldOrder.index(symbol)
		raise "Invalid symbol: #{symbol.inspect}" if offset == nil
		return input[offset]
	end
	
	def getContentField(input, symbol)
		entities = HTMLEntities.new
		output = getField(input, symbol)
		output = removeTags(output)
		output.force_encoding('utf-8')
		output = entities.decode(output)
		return output
	end
	
	def search(term)
		url = getURL(CGI.escape(term))
		data = Nil.httpDownload(url, @cookies)
		return nil if data == nil
		output = []
		data.scan(@pattern) do |match|
			url = getField(match, :url)
			title = getContentField(match, :title)
			description = getContentField(match, :description)
			result = SearchResult.new(title, description, url)
			output << result
		end
		return output
	end
	
	def removeTags(input)
		output = ''
		withinTag = false
		input.each_byte do |i|
			i = i.chr
			case i
			when '<'
				withinTag = true
			when '>'
				withinTag = false
			else
				output += i if !withinTag
			end
		end
		return output
	end
end
