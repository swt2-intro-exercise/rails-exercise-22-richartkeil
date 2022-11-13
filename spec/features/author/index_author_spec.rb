require 'rails_helper'

describe "Index author page", type: :feature do
  it "should exist and render without error" do
    author_one = FactoryBot.create :author
    author_two = FactoryBot.create :author
    visit authors_path()

    expect(page).to have_text(author_one.name)
    expect(page).to have_text(author_one.homepage)
    expect(page).to have_link('Show', href: author_path(author_one))
    expect(page).to have_link('Edit', href: edit_author_path(author_one))

    expect(page).to have_text(author_two.name)
    expect(page).to have_text(author_two.homepage)
    expect(page).to have_link('Show', href: author_path(author_two))
    expect(page).to have_link('Edit', href: edit_author_path(author_two))

    expect(page).to have_link 'New Author', href: new_author_path
  end
end
