require_relative 'BingSearchEngine'

engine = BingSearchEngine.new
while true
	term = "test #{rand 100}"
	results = engine.search(term)
	break if results.empty?
	puts results.first.url
end
