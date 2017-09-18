require_relative 'network'
require_relative 'io'


module Groove
	class App
		def initialize agent
			@network = Network.new agent
			@music_list = @network.getMusicList
			# @music_id = @music_list.collect{ |e| e[:music_id] }
			puts "Initialization success."
		end

		public

		#
		# @return [Array[*<Hash>]]
		#
		# {
		# 	:music_id => [Fixnum],
		# 	:music_title => [String],
		# 	:play_count => [Fixnum],
		# 	:last_play_time => [String]
		# }
		#
		def getMusicList
			@network.getMusicList
		end


		#
		# @return [Array[*<Hash>]]
		#
		# {
		# 	:card_id => [String],
		# 	:name => [String],
		# 	:total_score => [String],
		# 	:title => [String]
		# }
		#
		def getFriendList
			@network.getFriendList
		end


		# @param [Array] id music_id
		# @return [Array[*<Hash>]]
		#
		# {
		# 	:music_id => [String],
		# 	:music_title=> [String],
		# 	:artist => [String],
		# 	:skin_name => [String],
		# 	:ex_flag => [Fixnum],
		# 	:simple_result_data => {
		# 		:rating => [String],
		# 		:no_miss => [Fixnum],
		# 		:full_chain => [Fixnum],
		# 		:perfect => [Fixnum],
		# 		:play_count => [Fixnum],
		# 		:is_clear_mark => [Bool],
		# 		:is_failed_mark => [Bool],
		# 		:music_level => [String]
		# 		:score => [Fixnum]
		# 		:max_chain => [Fixnum]
		# 		:adlib => [Fixnum]
		#
		# 	},
		# 	:normal_result_data => {
		# 		:rating => [String],
		# 		:no_miss => [Fixnum],
		# 		:full_chain => [Fixnum],
		# 		:perfect => [Fixnum],
		# 		:play_count => [Fixnum],
		# 		:is_clear_mark => [Bool],
		# 		:is_failed_mark => [Bool],
		# 		:music_level => [String]
		# 		:score => [Fixnum]
		# 		:max_chain => [Fixnum]
		# 		:adlib => [Fixnum]
		#
		# 	},
		# 	:hard_result_data => {
		# 		:rating => [String],
		# 		:no_miss => [Fixnum],
		# 		:full_chain => [Fixnum],
		# 		:perfect => [Fixnum],
		# 		:play_count => [Fixnum],
		# 		:is_clear_mark => [Bool],
		# 		:is_failed_mark => [Bool],
		# 		:music_level => [String]
		# 		:score => [Fixnum]
		# 		:max_chain => [Fixnum]
		# 		:adlib => [Fixnum]
		#
		# 	},
		# 	:extra_result_data => {
		# 		:rating => [String],
		# 		:no_miss => [Fixnum],
		# 		:full_chain => [Fixnum],
		# 		:perfect => [Fixnum],
		# 		:play_count => [Fixnum],
		# 		:is_clear_mark => [Bool],
		# 		:is_failed_mark => [Bool],
		# 		:music_level => [String]
		# 		:score => [Fixnum]
		# 		:max_chain => [Fixnum]
		# 		:adlib => [Fixnum]
		#
		# 	},
  		# 	:user_rank => [
  		# 		{
  		# 			:rank => [Fixnum],
  		# 			:difficulty => [Fixnum]
  		# 		},
		# 		{
  		# 			:rank => [Fixnum],
  		# 			:difficulty => [Fixnum]
  		# 		},
		# 		{
  		# 			:rank => [Fixnum],
  		# 			:difficulty => [Fixnum]
  		# 		},
		# 		{
  		# 			:rank => [Fixnum],
  		# 			:difficulty => [Fixnum]
  		# 		},
  		# 	:difficulty => [{:music_difficulty=>0}, {:music_difficulty=>1}, {:music_difficulty=>2}]
  		# 	:fav_flg => [Fixnum],
  		# 	:message => [unknown]
  		# 	}

		def getScoreDetail music_id
			res = [music_id].flatten.reduce( [] ) { |result,mcid| result << @network.getMusicDetail(mcid)}
		end

		def getWorldRankData id,diff,num
			res = []
			id.each { |_id| diff.each { |_diff| num.each { |_num|
				res += (@network.getMusicWorldScore _id,_diff,_num).first(100)
				# サーバーの仕様で101件返してくるため重複避け
			} } }
			res
		end

		def getFriendMusicList friend_id
			@network.getFriendMusicList friend_id
		end

		def getFriendScoreDetail friend_id,music_id
			@network.getFriendMusicDetail friend_id,music_id
		end

	end
end
