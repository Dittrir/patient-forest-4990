require 'rails_helper'

RSpec.describe 'Studio index page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
  end

  it 'shows the studios name and location' do
    visit "/studios"

    expect(page).to have_content(@studio_1.name)
    expect(page).to have_content(@studio_1.location)
  end
end
