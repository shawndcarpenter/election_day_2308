require './lib/candidate'
require './lib/race'
require './lib/election'

class Election
  attr_reader :year, :races, :year_candidates, :candidates

  def initialize(year)
    @year = year
    @races = []
    @candidates = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
   @candidates = @races.flat_map do |race|
      race.candidates
    end
  end

  def vote_counts
   vote_counts = candidates.each_with_object({}) do |candidate, hash|
      hash[candidate.name] = candidate.votes
   end
  end
end