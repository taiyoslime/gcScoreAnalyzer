module Groove
	module Remap
		def convert hash,e
			e.each { |x,y| hash[x] = y.to_proc[hash[x]] }
			hash
		end


		module_function
		def test hash


	end
end
