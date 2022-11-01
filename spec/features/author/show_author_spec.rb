require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist for an author and render without error" do
    an_author = FactoryBot.create :author
    visit author_path(an_author)
    expect(page).to have_text(an_author.name)
    expect(page).to have_text(an_author.homepage)
  end
end
