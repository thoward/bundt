require 'sinatra'
require 'haml'
require 'sinatra/namespace'
require 'sinatra/json'
require_relative 'user_service/github'

enable :sessions
set :protection, except: :ip_spoofing
set :haml, format: :html5

not_found do
  # try to serve up login.html for /login, etc.. 
  redirect request.path_info + ".html" unless request.path_info.end_with? ".html" or request.path_info.end_with? "/" or request.request_method != 'GET'
  haml :'404'
end

error { @error = request.env['sinatra_error'] ; haml :'500' }

get '/' do
  redirect '/index.html'
end

## API Endpoints

namespace '/api/:service/:token' do

  services = {
    'github' => UserService::Github.new
  }
  
  def json_or_404(result)
    if result == nil
      status 404
    else
      json result
    end 
  end

  namespace '/group/:id' do

    # Group CRUD
    get '' do |service, token, id|
      json_or_404 services[service].groups(token).find {|group| group[:id] == id }
    end

    put '' do |service, token, id|
    end
    delete '' do |service, token, id|
    end

    # Group's users
    get '/users' do |service, token, id|
    end

    # Group's templates
    get '/templates' do |service, token, id|
    end
  end

  namespace '/user/:id' do

    # User CRUD
    get '' do |service, token, id|
    end
    put '' do |service, token, id|
    end
    delete '' do |service, token, id|
    end

    # User's teams
    get '/teams' do |service, token, id|
    end

    # User's reports
    get '/reports' do |service, token, id|
    end

    # User's reports, by group
    get '/reports/:group' do |service, token, id, group|
    end
  end

  namespace '/template/:id' do
    # Template CRUD
    get '' do |service, token, id|
    end
    put '' do |service, token, id|
    end
    delete '' do |service, token, id|
    end  

    # Templates's reports
    get '/reports' do |service, token, id|
    end   
  end

  namespace '/report/:id' do

    # Report CRUD
    get '' do |service, token, id|
    end
    put '' do |service, token, id|
    end
    delete '' do |service, token, id|
    end

    # Report's user
    get '/user' do |service, token, id|
    end

    # Report's group
    get '/group' do |service, token, id|
    end   

    # Report's group
    get '/comments' do |service, token, id|
    end   
  end

  namespace '/comment/:id' do

    # Comment CRUD
    get '' do |service, token, id|
    end
    put '' do |service, token, id|
    end
    delete '' do |service, token, id|
    end
  end
end