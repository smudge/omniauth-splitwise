require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-splitwise'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/splitwise'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :splitwise, ENV['SPLITWISE_KEY'], ENV['SPLITWISE_SECRET']
end

run App.new
