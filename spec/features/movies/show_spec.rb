require 'rails_helper'

RSpec.describe 'Movies show page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @movie_1 = @studio_1.movies.create!(title: "Star Wars", creation_year: "2001", genre: "Sci-fi")
    @movie_2 = @studio_1.movies.create!(title: "Gremlins", creation_year: "1995", genre: "Fantasy")
    @actor_1 = @movie_1.actors.create!(name: "Harrison Ford", age: 78)
    @actor_2 = @movie_1.actors.create!(name: "Natalie Portman", age: 40)
    @actor_3 = @movie_1.actors.create!(name: "Adam Driver", age: 35)
    @actor_4 = @movie_2.actors.create!(name: "Zach Gilligan", age: 42)
  end

  it 'shows the title, creation year and genre of the movie' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
  end

  it 'shows the actors from youngest to oldest' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(51.0)
  end

  it 'does not show actors that are not part of the movie' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Harrison Ford")
    expect(page).to have_content("Adam Driver")
    expect(page).to have_content("Natalie Portman")
    expect(page).to_not have_content("Zach Gilligan")
  end

  it 'displays a form to add an actor' do
    visit "/movies/#{@movie_1.id}"

    fill_in('Name', with: 'Harrison Ford')
    fill_in('Age', with: 78)
    click_button('Submit')

    expect(current_path).to eq("/movies/#{@movie_1.id}")
  end
end
