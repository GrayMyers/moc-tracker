require 'rails_helper'

RSpec.describe GovtFacade do
  describe 'happy path' do
    it 'processes data for our controller' do
      VCR.use_cassette('Govt_Search/happy_path/allows_user_to_search_for_govt_members') do
        name = 'Sanders'

        # exercise our code by calling our Facade
        result = GovtFacade.find_member_by_name(name)

        # expect that we get a PORO or array of POROs
        expect(result).to be_an(Member)
      end
    end
  end

  describe 'sad path' do
    it 'returns nil if no match is found' do
      VCR.use_cassette('Govt_Search/happy_path/allows_user_to_search_for_govt_members') do
        name = 'liho98u 4n9uaw 4tn9un'

        result = GovtFacade.find_member_by_name(name)

        expect(result).to be_nil
      end
    end
  end
end
