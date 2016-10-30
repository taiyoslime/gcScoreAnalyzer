require_relative 'groove/version'
require_relative 'groove/const'
require_relative 'groove/app'
require_relative 'groove/network'

module Groove
	module_function
	def init id,passwd
		agent = Groove::Network::auth id,passwd
	 	return Groove::App.new agent if agent.page.uri.to_s == Groove::Network::HOST + Groove::Network::ROOT + "/"
		raise "Authorization failid. Please try again." if URI.parse(agent.page.uri.to_s).path == Groove::Network::AUTH
		raise "Something is wrong. Please try again. "
	end
end
