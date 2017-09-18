# ---------------------------------------
# usage:
# $ ruby main.rb $necia_id $password $friend_screen_name
# ---------------------------------------

require_relative "../../lib/groove"
class NilClass; def method_missing(name, *args, &block)nil end;end

# 認証
#
groove = Groove::init ARGV[0], ARGV[1]

friend_list = groove.getFriendList

# 第3引数で指定したユーザー名が存在しなかったらエラー
raise "Friend Name #{ARGV[2]} does not exist. " if (friend = friend_list.find{|e| e[:name] == ARGV[2]}) == nil

friend_music_detail = groove.getFriendMusicList(friend[:card_id]).reduce([]){|res,e|
    res << groove.getFriendScoreDetail(friend[:card_id],e[:music_id])
}
my_music_detail = groove.getMusicList.reduce([]){|res,e|
    res << groove.getScoreDetail(e[:music_id])
}

result = my_music_detail.reduce([]){|res,e|
    Groove::RESULT[Groove::HARD,Groove::EXTRA].each{|diff|
        my_score = e[0][diff][:score] ||  0
        friend_score = friend_music_detail.find{|el| el[:music_id] == e[0][:music_id]}[diff][:score] || 0
        if my_score != 0 and friend_score != 0
            res << {
                music_title: e[0][:music_title],
                difficulty: diff.to_s.sub(/_result_data/,"").upcase,
                my_score:my_score,
                friend_score:friend_score,
                diff:my_score-friend_score
            }
        end
    }
    res
}.sort_by{|e| -e[:diff]}

Groove::IO.write result,"result.yml"
