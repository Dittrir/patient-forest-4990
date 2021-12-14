require 'rails_helper'

RSpec.describe 'Studio index page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @movie_1 = @studio_1.movies.create!(title: "Star Wars", creation_year: "2001", genre: "Sci-fi")
    @movie_2 = @studio_1.movies.create!(title: "Gremlins", creation_year: "1995", genre: "Fantasy")
  end

  it 'shows the studios name and location' do
    visit "/studios"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)
  end

  it 'shows all the movie titles' do
    visit "/studios"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
  end
end
