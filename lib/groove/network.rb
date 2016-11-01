require_relative 'network/auth'

module Groove
	class Network

		def initialize agent
			@agent = agent
		end

		HOST = "https://mypage.groovecoaster.jp"
		ROOT = "/sp"
		PBROOT = ROOT + "/json"
		AUTH = ROOT + "/login/auth.php"
		LOGIN = HOST + AUTH
		MCLIST = HOST + PBROOT + "/music_list.php" # to add query
		MCDATA = HOST + PBROOT + "/music_detail.php"
		SCRANK = HOST + PBROOT + "/score_ranking_bymusic_bydifficulty.php"
		FDLIST = HOST + PBROOT + "/friend_list.php"
		FDMCLIST = HOST + PBROOT + "/friend_music_list.php"
		FDMCDATA = HOST + PBROOT + "/friend_music_detail.php"

		public
		def getMusicList
			request(MCLIST)[:music_list]
			# to exclude status code
		end

		def getMusicDetail music_id
			request(MCDATA + "?music_id=#{music_id}")[:music_detail]
		end

		def getMusicWorldScore music_id,difficulty,page
			request(SCRANK + "?music_id=#{music_id}&difficulty=#{difficulty}&page=#{page}")[:score_rank]
		end

		def getFriendList
			request(FDLIST)[:friendList]
		end

		def getFriendMusicList friend_id
			request(FDMCLIST + "?hash=#{friend_id}")[:music_list]
		end

		def getFriendMusicDetail music_id,friend_id
			request(FDMCDATA + "?hash=#{friend_id}&music_id=#{music_id}")[:music_detail]
		end


		private
		def request url
			puts "[GET] #{url}"
			result = JSON.parse(@agent.get(url).body.force_encoding('utf-8'), symbolize_names:true)
			raise "Request \"[GET] : #{url} \"is not valid." unless result[:status].zero?
			result

			# found that both 0 and 1 are converted to true in ruby, which isn't in C++ lol.
			# status : 0 => success
			# status : 1 => error
		end
	end
end
