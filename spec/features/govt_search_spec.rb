require 'rails_helper'

RSpec.describe 'Govt Search' do
  describe 'happy path' do
    it 'allows user to search for govt members', :vcr do
      visit root_path

      fill_in :search, with: 'Sanders'
      click_button 'Search'

      # we should probably expect that data to show up on a page at some point...
    end

    # here's an example of how to re-use a VCR cassette from another test which uses :vcr
    # it 'some other test name' do
    #   VCR.use_cassette('Govt_Search/happy_path/allows_user_to_search_for_govt_members') do
    #   end
    # end
  end
end
