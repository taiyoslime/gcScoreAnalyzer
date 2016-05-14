require_relative 'groove/version'
require_relative 'groove/app'

module Groove
	def init id,passwd
		module_function
		agent = Groove::Network::auth id,passwd
		return Groove::App.new agent unless agent.nil?
	end
end
