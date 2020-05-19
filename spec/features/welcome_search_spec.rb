require 'rails_helper'

RSpec.describe 'As a user' do
  it 'Member Search' do
    visit root_path

    expect(current_path).to eql('/')

    select('Gryffindor', from: :house)
    click_button 'Search For Members'


  end

end
