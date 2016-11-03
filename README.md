## このドキュメントは現在制作中です....
[English is here](README-en.md)

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

## Initialization

```ruby
necica_id = XXXXXXXXXXXX
pasword = XXXXXXXXXX

# 初期化
groove = Groove::init necica_id,password
```

## Methods

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

### #getScoreDetail (music_id) -> [Array]

- (PARAM) music_id : [Array]

### #getFriendList -> [Array]

### #getFriendMusicList (friend_id) -> [Array]

- (PARAM) friend_id : [Array]

### #getFriendScoreDetail (music_id,difficulty) -> [Array]

- (PARAM) music_id : [Array]
- (PARAM) difficulty : [Array]

### #getWorldRankData (music_id,difficulty,page)

- (PARAM) music_id : [Array]
- (PARAM) difficulty : [Array]
- (PARAM) page : [Array]

### Groove::init

### Groove::IO.read (path) -> [Object]

- (PARAM) path : [String]

### Groove::IO.write (path,content)

- (PARAM) path : [String]
- (PARAM) content : [Object]

## Constants

### Groove::SIMPLE
### Groove::NORMAL
### Groove::HARD
### Groove::EXTRA
### Groove::DIFFCULT_ALL
### Groove::VERSION

## Contributing

グルコス技術部の方からのPR待ってます


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
