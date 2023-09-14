class Candidate
attr_reader :name, :party, :votes

  def initialize(data)
    @name = data.fetch(:name)
    @party = data.fetch(:party)
    @votes = 0
  end


  def vote_for!
    @votes += 1
  end
end