require 'sinatra'
require 'net/ping'

set :views, File.expand_path('../views', __FILE__)

get '/' do
  erb :ping_status
end

get '/ping/:host' do
  content_type :json
  host = params[:host]
  ping = Net::Ping::External.new(host)
  
  if ping.ping
    { result: "Ligado" }.to_json
  else
    { result: "Desligado" }.to_json
  end
end
