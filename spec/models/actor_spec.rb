require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should belong_to(:movie) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'methods' do
    before(:each) do
      @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "Star Wars", creation_year: "2001", genre: "Sci-fi")
      @movie_2 = @studio_1.movies.create!(title: "Gremlins", creation_year: "1995", genre: "Fantasy")
      @actor_1 = @movie_1.actors.create!(name: "Harrison Ford", age: 78)
      @actor_2 = @movie_1.actors.create!(name: "Natalie Portman", age: 40)
      @actor_3 = @movie_1.actors.create!(name: "Adam Driver", age: 35)
    end

    it 'shows the actors from youngest to oldest' do
      expect(@movie_1.actors.youngest_to_oldest).to eq ([@actor_3, @actor_2, @actor_1])
    end

    it 'shows the average age of all the movies actors' do
      expect(@movie_1.actors.average_age).to eq(51)
    end
  end
end
