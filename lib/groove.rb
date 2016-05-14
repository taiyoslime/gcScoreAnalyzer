require "groove/version"
require "groove/auth"

module Groove
  module_function
  def init id,passwd
	  return self.auth(id,passwd)
  end
end
