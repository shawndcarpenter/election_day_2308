require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe do
  before(:each) do
    @race_1 = Race.new("Texas Governor")
    @race_2 = Race.new("Utah Governor")
    @diana = @race_1.register_candidate!({name: "Diana D", party: :democrat})
    @roberto = @race_2.register_candidate!({name: "Roberto R", party: :republican})
    @brian = @race_1.register_candidate!({name: "Brian", party: :conservative})
    @angel = @race_2.register_candidate!({name: "Angel", party: :democrat})
    @liza = @race_1.register_candidate!({name: "Liza", party: :conservative})
    @year_2024 = Election.new("2024")
  end

  it "creates new election year" do
    expect(@year_2024.class).to eq(Election)
  end

  it "has a year" do
    expect(@year_2024.year).to eq("2024")
  end

  it "has an array of races" do
    expect(@year_2024.races).to eq([])
  end

  it "can add races" do
    @year_2024.add_race(@race_1)
    expect(@year_2024.races).to eq([@race_1])
  end

  it "can hold all candidates in election" do
    @year_2024.add_race(@race_1)
    @year_2024.add_race(@race_2)
    expect(@year_2024.candidates).to eq([@diana, @brian, @liza, @roberto, @angel])
  end

  it "counts votes for each candidate's name" do
    @year_2024.add_race(@race_1)
    @year_2024.add_race(@race_2)
    @diana.vote_for!
    @diana.vote_for!
    @diana.vote_for!
    @brian.vote_for!
    @liza.vote_for!
    expect(@year_2024.vote_counts).to eq({"Diana D"=>3, "Brian"=>1, "Liza"=>1, "Roberto R"=>0, "Angel"=>0})
  end
end