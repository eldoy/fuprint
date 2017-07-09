module Fuprint
  class Request

    include ::Fuprint::Helpers

    def initialize(app)
      @app = app
    end

    # Thread safe call
    def call(env)
      dup.call!(env)
    end

    # Receive the request and print info
    def call!(env)
      print_info(env)
      @app.call(env)
    end

  end
end
