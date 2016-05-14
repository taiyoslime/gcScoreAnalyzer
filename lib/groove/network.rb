require_relative 'network/auth'

module Groove
	class Network

		def initialize agent
			@agent = agent
		end

		HOST = "https://mypage.groovecoaster.jp"
		PBROOT = "/sp/json"
		MCLIST = HOST + PBROOT + "/music_list.php" # to add query
		MCDATA = HOST + PBROOT + "/music_detail.php"
		SCRANK = HOST + PBROOT + "/score_ranking_bymusic_bydifficulty.php"

		public
		def getMusicList
			request(MCLIST)['music_list']
			# to exclude status code
		end

		def getMusicData musicid
			request(MCDATA + "?music_id=#{musicid}")['music_data']
		end

		private
		def request url
			result = JSON.load(@agent.get(url).body.force_encoding('utf-8'))
			pp result
			return result if result['status'] == 0
			# found that both 0 and 1 are converted to true in ruby, which isn't in C++ lol.
			# status : 0 => success
			# status : 1 => error
		end
	end
end
