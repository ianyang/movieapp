require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'open-uri'

get '/' do
  erb :home

end

def get_data(q)
  url = "http://www.omdbapi.com/?s=#{URI.escape(q)}"
  results = JSON.load(open(url).read)
  return results["Search"]
end

get '/search' do
  @query = params[:q]
  @movies = get_data(@query)
  erb :result
end

get '/movie' do
  url = "http://www.omdbapi.com/?i=#{URI.escape(params[:id])}"
  @movie = JSON.load(open(url).read)
  erb :movie
end


