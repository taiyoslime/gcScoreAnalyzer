require 'mechanize'
module Groove
	class Network
		HOST = "https://mypage.groovecoaster.jp"

		#class method
		def self.auth id,passwd
			login = Mechanize.new
			login_page = login.get HOST
			login_page.body.force_encoding 'utf-8'

			form = login_page.forms[0]
			form.field_with(:name => "nesicaCardId").value = id
			form.field_with(:name => "password").value = passwd
			button = form.button_with(:value => "認証する")

			login.submit form,button

			pp login.get('https://mypage.groovecoaster.jp/sp/json/music_list.php').body
		end

		public




		def isLogin? mechanize
			mechanize.get('https://mypage.groovecoaster.jp/sp/json/music_list.php')body.found


	end
end
