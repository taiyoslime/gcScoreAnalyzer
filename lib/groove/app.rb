require_relative 'network'
require_relative 'io'

module Groove
	class App
		# attr_reader :music_list

		def initialize net
			@network = Network.new net

			@music_list = updateMusicList
			@music_id = @music_list.collect{ |e| e[:music_id] }  
			@music_score = updateMusicScore
			Groove::IO::write(@music_list,"data/music_list.yml")
			Groove::IO::write(@music_score,"data/music_score.yml")
		end

		public

		private
		def updateMusicScore(id:@music_id)
			id.reduce( [] ) { |result,mcid| result << @network.getMusicData(mcid) ; result }
		end

		def updateMusicList
			@network.getMusicList
		end

	end
end
