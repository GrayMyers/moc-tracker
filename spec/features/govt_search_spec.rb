require 'rails_helper'

RSpec.describe 'Govt Search' do
    describe 'happy path' do
        it 'allows user to search for govt members', :vcr do
            # VCR.use_cassette('all_senate_members') do
                # json_response = File.read('spec/fixtures/govt_data.json')
                # stub_request(:get, "https://api.propublica.org/congress/v1/116/senate/members.json").
                #     with(
                #         headers: {
                #         'X-Api-Key'=>ENV['propublica_api_key']
                #     }).
                #     to_return(status: 200, body: json_response, headers: {})

                visit root_path

                fill_in :search, with: 'Sanders'
                click_button 'Search'

            # end
        end

        it 'some other test name' do
            VCR.use_cassette('Govt_Search/happy_path/allows_user_to_search_for_govt_members') do
            end
        end
    end
end