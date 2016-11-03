## このドキュメントは現在制作中です....



## Overview

GROOVE COASTER 3™ のスコアサーバー(https://mypage.groovecoaster.jp)データー収集統計ツール

Rubyのみで書かれています。

## Installation

```
$ gem install groove
```

`bundle`等使う場合は適当にやってください


もし`nokogiri`関係のエラーで落ちた場合は
```
$ bundle config build.nokogiri --use-system-libraries
```

を試して見てください

## Usage

### Initialization

```ruby
necica_id = XXXXXXXXXXXX
pasword = XXXXXXXXXX

# 初期化
groove = Groove::init necica_id,password
```

### #getMusiclist -> [Array]

```ruby
p groove.getMusiclist

# => [{
# 	:music_id=>999,
# 	:music_title=>"The Beginning",
# 	:play_count=>23,
# 	:last_play_time=>"2016-11-02 19:30:37"},
# 	.....
```
### #getFriendList -> [Array]


## Contributing

グルコス技術部の方からのPR待ってます


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
