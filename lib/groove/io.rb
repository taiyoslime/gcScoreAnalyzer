require 'yaml'
module Groove
	module IO
		module_function
		def read path
			YAML.load_file path
		end

		def write content,path
			open(path,"w") { |el| YAML.dump content,el }
		end
	end
end
