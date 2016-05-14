require "./app"

module Groove
	def init id,passwd
		s = Groove::Network::auth id,passwd
		return Groove::App.new s if !(s.nil?)
	end
end
