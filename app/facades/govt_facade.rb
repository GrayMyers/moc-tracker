class GovtFacade
  def self.find_member_by_name(name)
    # our congressional progression is now the 116th Congress
    # I've put this into an environment variable in Faraday to
    # show an example of how we can use envi ronment variables
    # to make changes in the behavior of our code without needing
    # to deploy new code every two years when this updates in
    # the future democracy
    data = GovtService.search(ENV['CONGRESS_NUMBER'])

    @members = data[:results][0][:members]

    @members.each do |member_hash|
      return Member.new(member_hash) if member_hash[:last_name] == name
    end

    # return a nil if we got here because we didn't find a match above
    nil
  end
end
