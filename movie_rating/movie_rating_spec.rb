require 'rspec'
require_relative 'movie_rating'


describe 'read_movie_file' do

  it 'converts a CSV to a compound array' do
    input = 'test_movies.csv'
    expect(read_movie_file(input)).to eq([["7 Faces of Dr. Lao", "1964"], ["7th Heaven", "1927"], ["8 Mile", "2002"], ["12 Years a Slave", "2013"], ["20 Feet from Stardom", "2013"]])
    expect(read_movie_file(input)).to_not eq("7 Faces of Dr. Lao,1964
                                              7th Heaven,1927
                                              8 Mile,2002
                                              12 Years a Slave,2013
                                              20 Feet from Stardom,2013
                                            ")
  end
end

describe 'parse_movie_data' do
  it 'prepares the array of movie data for querying the API' do
    file = 'test_movies.csv'
    input = read_movie_file(file)
    expect(parse_movie_data(input)).to eq([["7+Faces+of+Dr.+Lao", "1964"], ["7th+Heaven", "1927"], ["8+Mile", "2002"], ["12+Years+a+Slave", "2013"], ["20+Feet+from+Stardom", "2013"]])
    expect(parse_movie_data(input)).to_not eq([["7 Faces of Dr. Lao", "1964"], ["7th Heaven", "1927"], ["8 Mile", "2002"], ["12 Years a Slave", "2013"], ["20 Feet from Stardom", "2013"]])
  end
end


# RSpec.describe 'query_movie_data' do
#   it 'queries the OMDB API for movie data' do
#     file = 'test_movies.csv'
#     input = read_movie_file(file)
#     data  = parse_movie_data(input).first

#     expect(query_movie_data(data)).to eq([#<Net::HTTPOK 200 OK readbody=true>, #<Net::HTTPOK 200 OK readbody=true>])
#     # expect(query_movie_data(data)).to_not eq([["7 Faces of Dr. Lao", "1964"], ["7th Heaven", "1927"], ["8 Mile", "2002"], ["12 Years a Slave", "2013"], ["20 Feet from Stardom", "2013"]])
#   end
# end


describe 'format_movie_data' do
  it 'parses json returned by the API' do
    file = 'test_movies.csv'
    input = read_movie_file(file)
    data  = parse_movie_data(input)[0..1]
    query = query_movie_data(data)

    expect(format_movie_data(query)).to eq([{"Title"=>"7th Heaven", "Year"=>"1927", "Rated"=>"Not Rated", "Released"=>"N/A", "Runtime"=>"110 min", "Genre"=>"Drama, Romance", "Director"=>"Frank Borzage", "Writer"=>"Austin Strong (play), Benjamin Glazer (screenplay), H.H. Caldwell (titles), Katherine Hilliker (titles)", "Actors"=>"Janet Gaynor, Charles Farrell, Ben Bard, Albert Gran", "Plot"=>"A street cleaner saves a young woman's life, and the pair slowly fall in love until war intervenes.", "Language"=>"English", "Country"=>"USA", "Awards"=>"Won 3 Oscars. Another 3 wins & 2 nominations.", "Poster"=>"http://ia.media-imdb.com/images/M/MV5BMTk2MjUzMzk3OV5BMl5BanBnXkFtZTcwOTk1MjQxMw@@._V1_SX300.jpg", "Metascore"=>"N/A", "imdbRating"=>"7.9", "imdbVotes"=>"1,757", "imdbID"=>"tt0018379", "Type"=>"movie", "Response"=>"True"}, {"Title"=>"7 Faces of Dr. Lao", "Year"=>"1964", "Rated"=>"N/A", "Released"=>"13 Aug 1964", "Runtime"=>"100 min", "Genre"=>"Fantasy, Mystery, Western", "Director"=>"George Pal", "Writer"=>"Charles Beaumont (screen play), Charles G. Finney (based on the novel \"The Circus of Dr. Lao\" by)", "Actors"=>"Tony Randall, Barbara Eden, Arthur O'Connell, John Ericson", "Plot"=>"A mysterious circus comes to a western town bearing wonders and characters that entertain the inhabitants and teach valuable lessons.", "Language"=>"English", "Country"=>"USA", "Awards"=>"Nominated for 1 Oscar. Another 1 win & 1 nomination.", "Poster"=>"http://ia.media-imdb.com/images/M/MV5BMTMyNTgyMTAxMV5BMl5BanBnXkFtZTcwMDM2NDAyMQ@@._V1_SX300.jpg", "Metascore"=>"N/A", "imdbRating"=>"7.3", "imdbVotes"=>"3,143", "imdbID"=>"tt0057812", "Type"=>"movie", "Response"=>"True"}])
  end
end

describe 'display_movie_data' do
  it 'displays the required content in the required order' do
    # file = 'test_movies.csv'
    # input = read_movie_file(file)
    # data  = parse_movie_data(input)
    # query = query_movie_data(data)
    # formatted_data = format_movie_data(query)
    movies = read_movie_file('test_movies.csv')
    parsed_data = parse_movie_data(movies)
    caputred_data = query_movie_data(parsed_data)
    formatted_data = format_movie_data(caputred_data)

    # display_movie_data(formatted_data)
    expect(display_movie_data(formatted_data)).to equal("12 Years a Slave -- 8.2 ~ 7th Heaven -- 7.9 ~ 7 Faces of Dr. Lao -- 7.3 ~ 8 Mile -- 6.9 ~ ")
  end
end
