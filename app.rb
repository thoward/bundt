require 'sinatra'
require 'haml'

enable :sessions
set :protection, except: :ip_spoofing
set :haml, format: :html5

get '/' do
    redirect '/index.html'
end

get '/bundt' do
    haml :index
end

not_found { haml :'404' }
error { @error = request.env['sinatra_error'] ; haml :'500' }