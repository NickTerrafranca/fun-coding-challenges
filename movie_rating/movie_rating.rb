# require 'pry'
require 'csv'
require 'json'
# require 'open-uri'
require "net/http"
require "uri"

def read_movie_file(file)
  movie_date = CSV.read(file)
end

def parse_movie_data(file_data)
  prepared_data = []
  file_data.each do |i|
    prepared_title = i[0].split.join('+')
    year = i[1]
    prepared_data << [prepared_title, year]
  end
  prepared_data
end

def query_movie_data(parsed_data)
  parsed_data = parsed_data[0..4]
  # binding.pry
  response_data = []
  parsed_data.each do |i|
    title = i[0]
    year = i[1]
    uri = URI.parse(URI.encode("http://www.omdbapi.com/?t=#{title}&type=movie&y=#{year}&r=json".strip))
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response_data << response
  end
  response_data
end

def format_movie_data(query)
  movie_list = []
  query.each do |i|
    movie = JSON.parse(i.body)
    unless movie["Error"] || movie["imdbRating"] == "N/A"
      movie_list << movie
    end
  end
  movie_list.sort_by! { |k| k["imdbRating"] }.reverse
end

def display_movie_data(formatted_data)
  formatted_data.each do |i|
    puts "#{i["Title"]} -- #{i["imdbRating"]}"
  end
end


movies = read_movie_file('movies.csv')
parsed_data = parse_movie_data(movies)
caputred_data = query_movie_data(parsed_data)
display_movie_data(format_movie_data(caputred_data))




# def aquire_movie_data(parsed_data)
#   response_data = []
#   parsed_data.each do |i|
#     title = i[0]
#     # year = i[1]
#     uri = URI.parse(URI.encode("http://www.omdbapi.com/?s=#{title}&r=json".strip))
#     # uri = URI.parse("http://www.omdbapi.com/?s=#{title}&r=json")
#     http = Net::HTTP.new(uri.host, uri.port)
#     request = Net::HTTP::Get.new(uri.request_uri)
#     response = http.request(request)
#     response_data << response.body
#   end
#   response_data
# end

# def caputre_movie_data(parsed_data)
#   parsed_data.each do |i|
#     title = i[0]
#     year = i[1]
#     json = JSON.parse(open("http://www.omdbapi.com/?t=#{title}&r=json") { |x| x.read })
#   end
#   json
# end

# movie = parsed_data.first
# title = movie[0]

# uri = URI.parse("http://www.omdbapi.com/?t=#{title}&r=json")
# http = Net::HTTP.new(uri.host, uri.port)
# request = Net::HTTP::Get.new(uri.request_uri)
# response = http.request(request)
# puts response.body


# p parse_movie_data(read_movie_file('movies.csv'))
# json = JSON.parse(open("http://www.omdbapi.com/?t=Zero+Dark+Thirty&y=2012&plot=short&r=json") { |x| x.read })
  # puts "#{json["Title"]} -- #{json["imdbRating"]}"


# json = JSON.parse(open("http://www.omdbapi.com/?t=#{prepared_title}&y=#{year}&plot=short&r=json") { |x| x.read })
#   puts "#{json["Title"]} -- #{json["imdbRating"]}"
# puts "#{json["Title"]} -- #{json["imdbRating"]}"



# /Users/nterrafranca/.rvm/rubies/ruby-2.0.0-p451/lib/ruby/2.0.0/uri/common.rb:176:in `split': bad URI(is not URI?): http://www.omdbapi.com/?t=Arthur+Rubinstein+–+The+Love+of+Life&r=json (URI::InvalidURIError)
#   from /Users/nterrafranca/.rvm/rubies/ruby-2.0.0-p451/lib/ruby/2.0.0/uri/common.rb:211:in `parse'
#   from /Users/nterrafranca/.rvm/rubies/ruby-2.0.0-p451/lib/ruby/2.0.0/uri/common.rb:747:in `parse'
#   from movie_rating.rb:37:in `block in caputre_movie_data'
#   from movie_rating.rb:34:in `each'
#   from movie_rating.rb:34:in `caputre_movie_data'
#   from movie_rating.rb:50:in `<main>'
