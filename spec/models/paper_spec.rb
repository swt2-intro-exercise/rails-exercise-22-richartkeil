require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "is created properly" do
    paper = Paper.new(
      title: "COMPUTING MACHINERY AND INTELLIGENCE",
      venue: "Mind 49: 433-460",
      year: 1950
    )
    expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(paper.venue).to eq("Mind 49: 433-460")
    expect(paper.year).to eq(1950)
  end

  it "has an empty list of authors" do
    paper = Paper.new(
      title: "COMPUTING MACHINERY AND INTELLIGENCE",
      venue: "Mind 49: 433-460",
      year: 1950
    )
    expect(paper.authors).to be_empty
  end
end
