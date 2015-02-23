Dependencies:
Ruby 2.0
Requires Modules URI, JSON
Requires Classes NET/HTTP, CSV

Execute program by running > ruby movie_rating.rb
It may take several minutes to load all of the data from the API

Development notes:
I really enjoyed this project. I do not have very much experience working with APIs, so I learned a good deal. The first edge cases I worked to deal with was the API returning results that where not movies but still contained the movie tittle in the body. Another one was dealing with movies that did not have an imdbRating, and yet another was when the API returned an error. These edge cases where dealt with in the format_movie_data method. I used Pry for most of my debugging. I spent an afternoon on this project.
