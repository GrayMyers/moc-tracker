class GovtService
  def self.search(congress_number)
    response = conn.get("/congress/v1/#{congress_number}/senate/members.json")

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.propublica.org') do |faraday|
      faraday.headers['X-API-KEY'] = ENV['propublica_api_key']
    end
  end
end
