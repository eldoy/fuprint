module Fuprint
  module Helpers

    # Print info
    def print_info(env, req = nil)

      # Only active in development or test modes
      return unless %w[development test].include?(Fuprint.mode)

      # Create request unless it exists
      req = ::Rack::Request.new(env) unless req

      # Print debug
      puts env.inspect if Fuprint.debug

      # Delete the splat and captures if Fuprint.splat = false (default)
      req.params.delete_if{|k, v| Fuprint.clean.include?(k)} unless Fuprint.clean.any?

      # Strip all params if Fuprint.strip = true (default)
      req.params.each{|k, v| req.params[k] = (v.is_a?(String) ? v.strip : v)} if Fuprint.strip

      begin
        puts "\n@ #{colorize(req.request_method.upcase)} #{colorize(req.fullpath)}"
        puts "$ #{colorize(req.params)}"
      rescue => e
        puts "! #{e}"
      end
    end

    # Colorize output, 33 is :green (default), 31 is :red
    def colorize(s, c = :green)
      %{\e[#{c == :green ? 33 : 31}m#{s}\e[0m}
    end

  end
end
