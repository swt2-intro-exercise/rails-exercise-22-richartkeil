require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)
  end

  it "should have text inputs for an author's first name, last name, and homepage" do
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)

    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should allow to update authors" do
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)

    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[last_name]', with: 'Turing'
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click

    an_author.reload
    expect(an_author.first_name).to eq('Alan')
    expect(an_author.last_name).to eq('Turing')
    expect(an_author.homepage).to eq('http://wikipedia.org/Alan_Turing')
  end

  it "should not allow to submit new authors without a last name" do
    an_author = FactoryBot.create :author
    visit edit_author_path(an_author)

    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[last_name]', with: ''
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click

    expect(page).to have_text("Last name can't be blank")
  end
end
