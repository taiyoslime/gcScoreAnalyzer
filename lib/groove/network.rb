require "network/auth"

module Groove
	class Network

		def initialize agent
			@agent = agent
		end

		HOST = "https://mypage.groovecoaster.jp"
		PBROOT = "/sp/json"
		MCLIST = HOST + PBROOT + "music_list.php" # to add query
		MCDATA = HOST + PBROOT + "music_detail.php"
		SCRANK = HOST + PBROOT + "score_ranking_bymusic_bydifficulty.php"

		public
		def getMusicList
			return request MCLIST
		end

		def getMucisData musicid
			return request MCDATA+ "?music_id=#{musicid}"
		end

		private
		def request url
			result = JSON.load agent.get(url).body.force_encoding 'utf-8'
			return result unless result.status
			# status : 0 => success
			# status : 1 => error
		end
	end
end
