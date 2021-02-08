require 'rails_helper'

RSpec.describe Member do
  describe 'happy path' do
    it 'builds a Member object' do
      # ruby hack for pasting JSON in as a Ruby hash: since Ruby doesn't have 'null'
      # we can make a variable called "null" and set it to 'nil' and then our NULL
      # references in the JSON data below will not cause a syntax error in Ruby :)
      null = nil
      data = {
          "id": "A000360",
          "title": "Senator, 2nd Class",
          "short_title": "Sen.",
          "api_uri": "https://api.propublica.org/congress/v1/members/A000360.json",
          "first_name": "Lamar",
          "middle_name": null,
          "last_name": "Alexander",
          "suffix": null,
          "date_of_birth": "1940-07-03",
          "gender": "M",
          "party": "R",
          "leadership_role": null,
          "twitter_account": "SenAlexander",
          "facebook_account": "senatorlamaralexander",
          "youtube_account": "lamaralexander",
          "govtrack_id": "300002",
          "cspan_id": "5",
          "votesmart_id": "15691",
          "icpsr_id": "40304",
          "crp_id": "N00009888",
          "google_entity_id": "/m/01rbs3",
          "fec_candidate_id": "S2TN00058",
          "url": "https://www.alexander.senate.gov/public",
          "rss_url": "https://www.alexander.senate.gov/public/?a=RSS.Feed",
          "contact_form": "http://www.alexander.senate.gov/public/index.cfm?p=Email",
          "in_office": false,
          "cook_pvi": null,
          "dw_nominate": 0.324,
          "ideal_point": null,
          "seniority": "17",
          "next_election": "2020",
          "total_votes": 717,
          "missed_votes": 133,
          "total_present": 0,
          "last_updated": "2020-12-30 19:01:18 -0500",
          "ocd_id": "ocd-division/country:us/state:tn",
          "office": "455 Dirksen Senate Office Building",
          "phone": "202-224-4944",
          "fax": "202-228-3398",
          "state": "TN",
          "senate_class": "2",
          "state_rank": "senior",
          "lis_id": "S289",
          "missed_votes_pct": 18.55,
          "votes_with_party_pct": 96.55,
          "votes_against_party_pct": 3.45
      }

      poro = Member.new(data)

      expect(poro).to be_a(Member)

      # because we have known data above in our setup, we must check that our PORO is
      # building itself properly with that data, or otherwise processing the incoming
      # 'data' hash in this case to build our full name, etc.
      expect(poro).to have_attributes(
        name: "#{data[:first_name]} #{data[:last_name]}",
        twitter: data[:twitter_account]
      )

      # we can also check that our data types match as well
      # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/have-attributes-matcher
      # expect(poro).to have_attributes(
      #   name: a_string_starting_with("#{data[:first_name]}"),
      #   total_votes: (a_value > 0)
      # )
    end
  end
end
