require "sinatra"
require "sinatra/json"

set :protection, except: [:json_csrf]

get "/" do
  "Hello!\n(ruby-#{RUBY_VERSION}) [#{RUBY_PLATFORM}]"
end
