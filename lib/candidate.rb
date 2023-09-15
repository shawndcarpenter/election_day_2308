class Candidate
attr_reader :name, :party, :votes
attr_writer :candidates

  def initialize(data)
    @name = data[:name]
    @party = data[:party]
    @votes = 0
  end


  def vote_for!
    @votes += 1
  end
end