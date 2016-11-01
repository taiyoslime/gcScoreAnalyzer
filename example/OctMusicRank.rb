# 10月新曲スコアアタック対象曲のワールドスコアランキングを算出する
#
# usage:
# ruby OctMusicRank.rb $necia_id $password

require_relative "../lib/groove"

# 認証
groove = Groove::init ARGV[0], ARGV[1]

music_id_list = [403, 405, 459, 464, 493, 494, 497, 513, 514, 515, 516]

# 403 => みくみくにしてあげる♪【してやんよ】
# 405 => サンドリヨン
# 464 => Preverse Love Rock!
# 493 => White World feat. 小田ユウ
# 494 => Help me, ERINNNNNN!! -Cranky remix-
# 497 => ロストワンの号哭
# 459 => Just Be Friends
# 513 => 裏表ラバーズ
# 514 => ダブルラリアット
# 515 => ローリンガール
# 516 => ハッピーシンセサイザ


# 各曲各難易度の1〜1000位までのスコアを取得
data = groove.getWorldRankData music_id_list, Groove::DIFFCULT_ALL, [*0..9]
Groove::IO.write data,"./score.yml"

score = {}

data.each { |el|
	# player_nameは一意ではないため、"SN + 称号 + 地域"をキーに指定する
	name = ("#{el[:player_name]} : #{el[:title]} : #{+el[:pref]}").to_sym
	score[name] = 0 if !score.has_key? name 
	score[name] += el[:event_point].to_i
}

# スコアを昇順に並べて終了
Groove::IO.write score.sort_by{|k,v| -v}.to_h,"./rank.yml"
