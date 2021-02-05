class PropublicaController < ApplicationController
  before_action :get_members, only: [:search]

  def search
    member_search = params[:search]
    found_member = @members.find {|m| m[:last_name] == member_search}
    # track favorite without DB - too much info for DB - remember for 30 days - name as key
    # session[:member_id] = found_member[:id] if found_member
  end

  private

  def get_members
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['propublica_api_key']
    end
    response = conn.get("/congress/v1/116/senate/members.json")

    json = JSON.parse(response.body, symbolize_names: true)
    @members = json[:results][0][:members]
  end
end
