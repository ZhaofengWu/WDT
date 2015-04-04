require "open-uri"
require "nokogiri"

PageCount = 10
WordsCount = 100
WikipediaRandomPage = "http://en.wikipedia.org/wiki/special:random"

class WordCount
	def initialize(webpageArray)
		@wordsHash = Hash.new 0
		self.countWordsAppearance(webpageArray)
	end
	#def appearanceForString(target)
	#	@wordsHash[target.to_s]
	#end
	def wordsWithMostAppearance(numberOfWords)
		@wordsHash = @wordsHash.sort{|a1, a2| a2[1] <=> a1[1]}.to_h
		hashWithRequiredNumbers = Hash.new 0
		i = 0
		while i < numberOfWords
			hashWithRequiredNumbers[@wordsHash.to_a[i][0]] = @wordsHash.to_a[i][1]
			i += 1
		end
		return hashWithRequiredNumbers
	end

	def countWordsAppearance(webpageArray)
		webpageArray.each do |aWebpage|
			bodyContent = String.new
			divNodeSet = Nokogiri::HTML(aWebpage).xpath("//body").xpath("//div").xpath("//*[@id]")
			divNodeSet.each do |aNode|
				if aNode.attr("id") == "mw-content-text"
					bodyContent = aNode.text
					break
				end
			end

			wordsArray =  bodyContent.split
			wordsArray.each do |aString|
				@wordsHash[aString] += 1
			end
		end
	end
end

def wikipediaRandomPageGenerator(numberOfPages)
	randomPages = Array.new
	i = 0
	while i < numberOfPages
		randomPages << open(WikipediaRandomPage).read
		i += 1
	end	
	return randomPages
end

p WordCount.new(wikipediaRandomPageGenerator(PageCount)).wordsWithMostAppearance(WordsCount)