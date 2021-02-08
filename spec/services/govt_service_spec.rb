require 'rails_helper'

RSpec.describe GovtService do
  describe 'happy path' do
    it 'calls our service and returns data' do
      VCR.use_cassette('Govt_Search/happy_path/allows_user_to_search_for_govt_members') do
        congress_number = ENV['CONGRESS_NUMBER']
        response = GovtService.search(congress_number)

        # data[:results][0][:members]

        expect(response).to be_a(Hash)

        check_structure_data(response, :results, Array)

        first_result = response[:results][0]
        check_structure_data(first_result, :members, Array)

        first_member = first_result[:members][0]

        # if you want to do it all one line at a time in a test:
        # expect(first_member).to have_key(:first_name)
        # expect(first_member[:first_name]).to be_a(String)

        # expect(first_member).to have_key(:last_name)
        # expect(first_member[:last_name]).to be_a(String)

        # expect(first_member).to have_key(:twitter_account)
        # expect(first_member[:twitter_account]).to be_a(String)

        # OR using a helper method
        check_structure_data(first_member, :first_name, String)
        check_structure_data(first_member, :last_name, String)
        check_structure_data(first_member, :twitter_account, String)
      end
    end
  end
end
