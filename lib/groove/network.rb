require_relative 'network/auth'

module Groove
	class Network

		def initialize agent
			@agent = agent
		end

		HOST = "https://mypage.groovecoaster.jp"
		ROOT = "/sp"
		PBROOT = ROOT + "/json"
		MCLIST = HOST + PBROOT + "/music_list.php" # to add query
		MCDATA = HOST + PBROOT + "/music_detail.php"
		SCRANK = HOST + PBROOT + "/score_ranking_bymusic_bydifficulty.php"


		public
		def getMusicList
			request(MCLIST)['music_list']
			# to exclude status code
		end

		def getMusicData musicid
			request(MCDATA + "?music_id=#{musicid}")['music_detail']
		end

		def getMusicWorldScore musicid,difficulty,page
			request(SCRANK + "?music_id=#{musicid}&difficulty=#{difficulty}&page=#{page}")['score']
		end

		private
		def request url
			result = JSON.load(@agent.get(url).body.force_encoding('utf-8'))
			pp result
			return result if result['status'].zero?
			# found that both 0 and 1 are converted to true in ruby, which isn't in C++ lol.
			# status : 0 => success
			# status : 1 => error
		end
	end
end
