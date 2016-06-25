module Groove
	module Extension
		# format of music data :
		#
		#
		#

		# base lambda
		collceteachdiff = ->(e,sym){
			e.reduce ( [] ) { | res,el |  res << {music_id:el[:music_id],music_title:el[:music_title]}.merge(el[sym]) ; res }
		 }

		clsimple  = ->(e){
			collecteachdiff.(e,:simple_result_data)
		}

		clalldiff = ->(e){
			
		}


		#TODO
		# JSONの構造化（特にrank）

		# public extension
		attr_reader
		score = -> e{  }
		eachMusicScore

		musicId

		musicCount

		eachMusicCount

		avarage

		eachMusicAvarage

		nearPerfect

		nearSpp

		highRank

	end

end
