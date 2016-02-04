require 'json'
require 'potter/version'
require 'potter/manager'
require 'potter/options'
require 'potter/runner'
require 'potter/error_handler'

module Potter
  class << self
    attr_accessor :config

    def config=(value)
      @config = value
    end

  end
end
