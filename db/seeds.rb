universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
movie_1 = @studio_1.movies.create!(title: "Star Wars", creation_year: "2001", genre: "Sci-fi")
movie_2 = @studio_1.movies.create!(title: "Gremlins", creation_year: "1995", genre: "Fantasy")
actor_1 = @movie_1.actors.create!(name: "Harrison Ford", age: 78)
actor_2 = @movie_1.actors.create!(name: "Natalie Portman", age: 40)
