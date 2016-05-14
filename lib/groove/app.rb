require_relative 'network'
require_relative 'io'

module Groove
	class App
		attr_reader :music_list

		def initialize el
			@network = Network.new el
			@music_list = updateMusicList
			@music_score = updateMusicScore
			Groove::IO::write(@music_list,"data/music_list.yml")
			Groove::IO::write(@music_score,"data/music_score.yml")
		end

		public
		def getMyScore(id:@music_list.collect{ |el| el["music_id"] })
			result = [] 
			id.each { |mcid| result << @music_score.collect { |el| } }
			result
		end

		private
		def updateMusicScore(id:@music_list.collect{ |el| el["music_id"] })
			result = []
			id.each { |mcid| result << @network.getMusicData(mcid) }
			result
		end

		def updateMusicList
			@network.getMusicList
		end


	end
end
