module Fuprint
  class Request

    def initialize(app)
      @app = app
    end

    # Receive the request and print info
    def call(env)

      # Only active in development mode
      if Fuprint.mode == 'development'
        r = ::Rack::Request.new(env)

        puts env.inspect if Fuprint.debug

        # Delete the splat and captures if Fuprint.splat = false (default)
        r.params.delete_if{|k, v| %w[splat captures].include?(k)} unless Fuprint.splat

        # Strip all params if Fuprint.strip = true (default)
        r.params.each{|k, v| r.params[k] = (v.is_a?(String) ? v.strip : v)} if Fuprint.strip

        begin
          puts "\n@ #{o(r.request_method.upcase)} #{o(r.fullpath)}"
          puts "$ #{o(r.params)}"
        rescue => e
          puts "! #{e}"
        end
      end

      @app.call(env)
    end

    private

    # Colorize output, 33 is :green (default), 31 is :red
    def o(s, c = :green)
      %{\e[#{c == :green ? 33 : 31}m#{s}\e[0m}
    end

  end
end
