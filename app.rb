require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do

    @bookmarks = [
              "http://www.google.com",
              "http://www.reuters.com",
              "http://www.bbc.co.uk"
              ]
    erb :'bookmarks/index'

  end

  run! if app_file == $0
end
