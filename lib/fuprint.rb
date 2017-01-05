require 'rack'

module Fuprint

  # # # # # #
  # Fuprint rack middleware request printer
  # @homepage: https://github.com/fugroup/fuprint
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.
  # # # # # #

  class << self; attr_accessor :mode, :debug; end
  @mode = ENV['RACK_ENV'] || 'development'
  @debug = false
end

require_relative 'fuprint/request'
