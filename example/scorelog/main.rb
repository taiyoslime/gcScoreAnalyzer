# ---------------------------------------
# usage:
# $ ruby main.rb $necia_id $password
# ---------------------------------------
require_relative "../../lib/groove"
require "rmagick"
require "time"

# 認証
groove = Groove::init ARGV[0], ARGV[1]

music_list = groove.getMusicList
unless File.exist? "dat/music_list.yml"
    score_detail = music_list.reduce([]){|res,e|
        res << groove.getScoreDetail(e[:music_id])
    }.flatten
    Groove::IO.write music_list,"dat/music_list.yml"
    Groove::IO.write score_detail,"dat/score_detail.yml"
end
base_music_list = Groove::IO.read "dat/music_list.yml"
base_score_detail = Groove::IO.read "dat/score_detail.yml"
last_play_date = Time.parse base_music_list[0][:last_play_time]
result = []
music_list.select{|e| Time.parse(e[:last_play_time]) > last_play_date}.each{|el|
    score = groove.getScoreDetail(el[:music_id]).flatten[0]
    old_score = base_score_detail.find{|e| e[:music_id] == score[:music_id]} || {}
    Groove::RESULT.each{|diff|
        old_score[diff] = {score:0,rating:"E",play_count:0} if old_score == {}
        if score[diff][:score] > old_score[diff][:score]
            result << {
                music_id: score[:music_id],
                music_level: score[diff][:music_level],
                music_title: score[:music_title],
                artist: score[:artist],
                old_score: old_score[diff][:score],
                score: score[diff][:score],
                score_diff: score[diff][:score] - old_score[diff][:score],
                play_count: score[diff][:play_count]
            }
        end
    }
    base_score_detail = base_score_detail.reject{|e|e[:music_id] == score[:music_id]}.unshift score
}

puts result

Groove::IO.write base_score_detail, "dat/new_score_detail.yml"
Groove::IO.write music_list,"dat/new_music_lust.yml"
