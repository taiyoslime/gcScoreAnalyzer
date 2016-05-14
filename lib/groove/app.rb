require 'network'

module Groove
	class App

		DIFFICULT = {
			SIMPLE: 0,
			NORMAL: 1,
			HARD: 2,
			EXTRA: 3
		}

		def initialize el
			@network = Network.new el
			@music_list
			@mucis_score
		end

		public

		def updateMusicScore
			result = []
			id.each { |mcid|
				result << @network.getMucisData(mcid)
			}
			result
		end

		def updateMusicList
			@network.getMusicList
		end

		def getMyScore(id:@mucis_list.collect{ |el| el["music_id"] })
			result = []
			id.each { |mcid|
				result << @music_score.collect { |el|  }
			}
			result
		end

		private

	end
end
