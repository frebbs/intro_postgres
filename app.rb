require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add-bookmark' do
    erb :add_a_new_bookmark
  end

  post '/create-new-bookmark' do
    Bookmark.create(params)
    redirect '/'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/'
  end

  run! if app_file == $0
end
