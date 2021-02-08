class Member
  attr_reader :name, :twitter

  def initialize(data)
    @name = "#{data[:first_name]} #{data[:last_name]}"
    @twitter = data[:twitter_account]
  end
end
