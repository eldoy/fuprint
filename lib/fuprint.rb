require 'rack'

module Fuprint

  # Fuprint rack middleware request printer
  # @homepage: https://github.com/fugroup/fuprint
  # @author:   Vidar <vidar@fugroup.net>, Fugroup Ltd.
  # @license:  MIT, contributions are welcome.

  class << self; attr_accessor :clean, :strip, :mode, :debug; end

  # Delete these parameters before every request
  @clean = %w[splat captures _method]

  # Remove white space from all params
  @strip = true

  # Mode
  @mode = ENV['RACK_ENV'] || 'development'

  # Debug
  @debug = false
end

require_relative 'fuprint/helpers'
require_relative 'fuprint/request'
