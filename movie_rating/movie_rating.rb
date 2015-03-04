require 'csv'
require 'json'
require 'net/http'
require 'uri'

def read_movie_file(file)
  movie_data = CSV.read(file)
end

def parse_movie_data(file_data)
  file_data = file_data # [1..2] remove this
  prepared_data = []
  file_data.each do |i|
    prepared_title = i[0].split.join('+')
    year = i[1]
    prepared_data << [prepared_title, year]
  end
  prepared_data
end

def query_movie_data(parsed_data)
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
    unless movie['Error'] || movie['imdbRating'] == 'N/A'
      movie_list << movie
    end
  end
  movie_list.sort_by! { |k| k['imdbRating'] }.reverse
end

def display_movie_data(formatted_data)
  formatted_data.each do |i|
    print "#{i["Title"]} -- #{i["imdbRating"]} ~ "
  end
end

# movies = read_movie_file('movies.csv')
# parsed_data = parse_movie_data(movies)
# caputred_data = query_movie_data(parsed_data)
# formatted_data = format_movie_data(caputred_data)
# p display_movie_data(formatted_data)
