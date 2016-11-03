## This document is under construction....



## Overview

A score analyzing tool for GROOVE COASTER 3™.

## Installation


```ruby
gem 'groove'
```

And then execute:

```
$ bundle
```
Or install it yourself as:

```
$ gem install groove
```


If you fail to install with `nokogiri module`, try executing below:

```
$ bundle config build.nokogiri --use-system-libraries
```

## Usage

## Initialization

```ruby
necica_id = XXXXXXXXXXXX
pasword = XXXXXXXXXX

# Initialize
groove = Groove::init necica_id,password
```

## #getMusiclist -> [Array]

```ruby
p groove.getMusiclist

# => [{
# 	:music_id=>999,
# 	:music_title=>"The Beginning",
# 	:play_count=>23,
# 	:last_play_time=>"2016-11-02 19:30:37"},
# 	.....
```
## #getFriendList -> [Array]




## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/taiyoslime/gcScoreAnalyzer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
