
require_relative "../lib/groove"

groove = Groove::init(ARGV[0],ARGV[1])

music_id_list = [403, 405, 459, 464, 493, 494, 497, 513, 514, 515, 516]


data = groove.getWorldRankData(music_id_list,Groove::DIFFCULT_ALL,[*0..10])
Groove::IO.write data,"./data.yml"


score = {}
data.each { |el|
	name = ("#{el[:player_name]} : #{el[:title]} : #{+el[:pref]}").to_sym
	score[name] = 0 if !score.has_key?(name)
	score[name] += el[:event_point].to_i
}

Groove::IO.write score.sort_by{|k,v| -v}.to_h,"./score.yml"
