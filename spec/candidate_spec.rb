require './lib/candidate'

RSpec.describe Candidate do

  describe "#initialize" do
    before(:each) do
      @diana = Candidate.new({name: "Diana D", party: :democrat})
    end

    it "can create a candidate" do
      expect(@diana.name).to eq("Diana D")
      expect(@diana.party).to eq(:democrat)
    end

    it "can be voted for" do
      expect(@diana.votes).to eq(0)
      @diana.vote_for!
      @diana.vote_for!
      @diana.vote_for!
      expect(@diana.votes).to eq(3)
      @diana.vote_for!
      expect(@diana.votes).to eq(4)
    end
  end
end