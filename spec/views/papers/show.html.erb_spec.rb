require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
    @paper = Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2,
      authors: [Author.create!(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")]
    )
    assign(:paper, @paper)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
  end

  it "should have a link to the author's page" do
    render
    expect(rendered).to have_link("Alan Turing", href: author_path(@paper.authors.first))
  end
end
