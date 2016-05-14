require 'net/http'
require 'openssl'

module Groove
	module Network
		module_function
		def auth_with_post id,passwd
  			path = "/sp/login/auth.php"
  			body = "nesicaCardId=#{id}&password=#{passwd}"
  			https = Net::HTTP.new(HOST, 443)
			https.use_ssl = true
			https.verify_mode = OpenSSL::SSL::VERIFY_NONE
			response = https.start { |https| https.post(path, body) }
			return "PHPSESSID=" + response['set-cookie'].split('; ')['PHPSESSID']
		end
	end
end
