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
    expect(page).to have_link('Delete', href: author_path(author_one))

    expect(page).to have_text(author_two.name)
    expect(page).to have_text(author_two.homepage)
    expect(page).to have_link('Show', href: author_path(author_two))
    expect(page).to have_link('Edit', href: edit_author_path(author_two))
    expect(page).to have_link('Delete', href: author_path(author_two))

    expect(page).to have_link 'New Author', href: new_author_path
  end

  it "should allow to delete authors" do
    author = FactoryBot.create :author
    visit authors_path()

    expect(Author.count).to eq(1)
    expect(page).to have_text(author.name)

    find('a[data-turbo-method="delete"][href="' + author_path(author) + '"]').click

    expect(Author.count).to eq(0)
    expect(page).not_to have_text(author.name)
  end
end
