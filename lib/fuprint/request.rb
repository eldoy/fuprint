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

        begin
          puts "\n@ #{o(r.request_method.upcase)} #{o(r.fullpath)}"
          puts "$ #{o(r.params)}"
        rescue => e
          puts "! #{e}"
        end
      end

      @app.call(env)
    end
  end

  private

  # Colorize output, 33 is :green (default), 31 is :red
  def o(s, c = :green)
    %{\e[#{c == :green ? 33 : 31}33m#{text}\e[0m}
  end

end
