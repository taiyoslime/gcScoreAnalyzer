# ---------------------------------------
# usage:
# $ ruby main.rb $necia_id $password $friend_screen_name (option:$another_friend_screen_name)
# ---------------------------------------

require_relative "../../lib/groove"

class NilClass; def method_missing(name, *args, &block)nil end;end

is_Perfect = -> (e) { e[Groove::RESULT[Groove::HARD]][:score] == 1000000 &&  e[Groove::RESULT[Groove::NORMAL]][:score] == 1000000 &&  e[Groove::RESULT[Groove::SIMPLE]][:score] == 1000000 }

groove = Groove::init ARGV[0], ARGV[1]

friend_list = groove.getFriendList

raise "Friend Name #{ARGV[2]} does not exist. " if (friend = friend_list.find{|e| e[:name] == ARGV[2]}) == nil
if ARGV[3] != nil
    raise "Friend Name #{ARGV[3]} does not exist. " if (friend2 = friend_list.find{|e| e[:name] == ARGV[3]}) == nil
    music_data = groove.getFriendMusicList(friend2[:card_id]).reduce([]){|res,e|
        res << groove.getFriendScoreDetail(friend2[:card_id],e[:music_id])
    }
else
    music_data = groove.getMusicList.reduce([]){|res,e|
        res << groove.getScoreDetail(e[:music_id])
    }.flatten
end

perfect_music_data = music_data.select{|e|
    is_Perfect.(e)
}

friend_music_data = perfect_music_data.reduce([]){|res,e|
     res << groove.getFriendScoreDetail(friend[:card_id],e[:music_id])
}

result = friend_music_data.select{|e|
    is_Perfect.(e)
}

Groove::IO.write result.reduce([]){|res,e| res << e[:music_title]} ,"result.yml"
