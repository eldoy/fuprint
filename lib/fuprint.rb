require 'rack'

module Fuprint

  # # # # # #
  # Fuprint rack middleware request printer
  # @homepage: https://github.com/fugroup/fuprint
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.
  # # # # # #

  class << self; attr_accessor :splat, :strip, :mode, :debug; end
  # Include splat and captures from Sinatra params
  @splat = false

  # Strip all params
  @strip = true

  # Mode
  @mode = ENV['RACK_ENV'] || 'development'

  # Debug
  @debug = false
end

require_relative 'fuprint/request'
