require_relative 'groove/version'
require_relative 'groove/app'
require_relative 'groove/network'

module Groove
	module_function
	def init id,passwd
		module_function
		agent = Groove::Network::auth id,passwd
	 	return Groove::App.new agent if agent.page.uri.to_s == Groove::Network::HOST + Groove::Network::ROOT + "/"
		p "Authorization failid. Please try again." and nil
	end
end
