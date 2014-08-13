# require 'rack/builder'
# require 'rack/static'

module Napa
  class Middleware
    class StaticFiles
      def initialize(app)
        @app = Rack::Builder.new do
          use Rack::Static, :urls => ['/', '/css', '/js'], :root => 'public', :index => 'index.html'
          run NotFound.new('public/404.html')
        end
      end

      def call(env)
        status, headers, body = @app.call(env)
        if status == 404
          NotFound.new('public/404.html').call(env)
        else
          [status, headers, body]
        end
      end

    end

    class NotFound
      def initialize(path = '')
        @path = path
        @content = 'Not Found'
      end
      def call(env)
        if ::File.exist?(@path)
          @content = ::File.read(@path)
        end
        length = @content.length.to_s
        [404, {'Content-Type' => 'text/html', 'Content-Length' => length}, [@content]]
      end
    end
  end
end