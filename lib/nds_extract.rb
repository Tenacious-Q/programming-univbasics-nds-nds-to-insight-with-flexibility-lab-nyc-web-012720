# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point
#puts "movie_with_director_name: "
#puts movie_with_director_name(directors_database[0][:name], directors_database[0][:movies][0])
#pp movie_with_director_name("Steven Spielberg", directors_database[0][:movies][0])


def movies_with_director_key(name, movies_collection)
  #puts name
  #puts name[:movies]   #=> ERROR - no implicit conversion of Symbol into Integer
  #puts "movie_collection length: #{movies_collection.length}"
  #pp movies_collection
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  new_array = []
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie

  i = 0
  while i < movies_collection.length do
    new_array << movie_with_director_name(name, movies_collection[i])
    i += 1
    #print new_array
  end

  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  #puts new_array[0]
  new_array
end

#puts "movies_with_director_key: "
#movies_with_director_key(directors_database[4][:name], directors_database[4][:movies])

# display MOVIES WITH DIRECTOR for Spielberg ONLY
#puts "***********************************************"
#puts directors_database[0][:name]
#puts directors_database[0][:movies][0]
#directors_database[0][:movies][0][:director_name] = directors_database[0][:name]
#puts directors_database[0][:movies][0]

def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie

  #pp collection
  #
  hash = {} # of the form {"Studio Name" => Studio total gross}
  # make an array to fill with studio names
  studios = []

  studio_total = 0
  i = 0
  while i < collection.length do
    puts "i is currently: #{i}"  #hg pretty printing

    if studios.include?(collection[i][:studio]) == false then
      studios << collection[i][:studio]
    end

         puts studios[i]  # hg pretty printing

    studio_name = collection[i][:studio]
    movie_gross = collection[i][:worldwide_gross]

   # - This correctly totals a few studios, but the
   # - studio keys seem to get overwritten -
   # - i.e. iteration 3 replaces the studio total
   # - with the next movie total instead of adding it.
    studio_total = 0 # - This line probably shouldn't be here, but not sure where it should go.
    k = 0
    while k < studios.length do
puts "studio_name: #{studio_name}"
      if studios[k] == studio_name then
        studio_total += movie_gross
        hash[studio_name] = studio_total
        puts hash[studios[k]]
      end

    k += 1
    end
    #else

    #if
    #  hash[i]
      #hash[collection[i][:studio]] = studio_gross += collection[i][:worldwide_gross]  #= total_gross
    #end

#################### Pretty Printing & Scratch Code #######################################
      puts "collection[i][:worldwide_gross]: #{collection[i][:worldwide_gross]}"
      puts "hash[collection[i]: #{hash[collection[i]]}"
      puts "hash[collection[i][:studio_gross]]: #{hash[collection[i][:studio_gross]]}"

      puts collection[i][:title]
      puts collection[i][:studio]
      #puts "TRUE!!!" if collection[i][:studio] == studios[i]
      #total_gross += collection[i][:worldwide_gross] if collection[i][:studio] == studios[i]

      puts collection[i][:worldwide_gross]
      #hash[collection[i][:studio_gross]] = collection[i][:worldwide_gross]
      puts hash
    #end
    i += 1
  end

  puts "studios: #{studios}"
  puts "hash: #{hash}"

  puts "Collection length: #{collection.length}"
  puts "Studios array length: #{studios.length}"

=begin
  index = 0
  total_gross = 0
  while index < studios.length do
  puts hash[studios[index]]
  index += 1
  end
=end

  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

  hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #pp source[0][:name]
  #pp source[0][:movies]
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  new_array = []
  i = 0
    while i < source.length do
      new_array << movies_with_director_key(source[i][:name], source[i][:movies])
      i += 1
    end
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  # puts new_array[0][0]
  new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
