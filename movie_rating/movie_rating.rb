require 'csv'

def read_movie_file(file)
  movie_date = CSV.read(file)
  p movie_date
end

read_movie_file('movies.csv')
