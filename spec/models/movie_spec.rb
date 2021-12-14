require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
  end
end
# before(:each) do
#   @movie_1 = Movie.create!(title: "Star Wars", create_year: "2001", genre: "Sci-fi")
# end
