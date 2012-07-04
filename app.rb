require 'sinatra'
require 'haml'
require 'sinatra/namespace'
require 'sinatra/json'

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

namespace '/api/:token' do

  namespace '/group/:id' do

    # Group CRUD
    get '' do |token, id|
      json :token => token, :id => id
    end
    put '' do |token, id|
    end
    delete '' do |token, id|
    end

    # Group's users
    get '/users' do |token, id|
    end

    # Group's templates
    get '/templates' do |token, id|
    end
  end

  namespace '/user/:id' do

    # User CRUD
    get '' do |token, id|
    end
    put '' do |token, id|
    end
    delete '' do |token, id|
    end

    # User's teams
    get '/teams' do |token, id|
    end

    # User's reports
    get '/reports' do |token, id|
    end

    # User's reports, by group
    get '/reports/:group' do |token, id, group|
    end
  end

  namespace '/template/:id' do
    # Template CRUD
    get '' do |token, id|
    end
    put '' do |token, id|
    end
    delete '' do |token, id|
    end  

    # Templates's reports
    get '/reports' do |token, id|
    end   
  end

  namespace '/report/:id' do

    # Report CRUD
    get '' do |token, id|
    end
    put '' do |token, id|
    end
    delete '' do |token, id|
    end

    # Report's user
    get '/user' do |token, id|
    end

    # Report's group
    get '/group' do |token, id|
    end   

    # Report's group
    get '/comments' do |token, id|
    end   
  end

  namespace '/comment/:id' do

    # Comment CRUD
    get '' do |token, id|
    end
    put '' do |token, id|
    end
    delete '' do |token, id|
    end
  end
end