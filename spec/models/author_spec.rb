require 'rails_helper'

RSpec.describe "The Author model", type: :model do
    it "is created properly" do
        author = Author.new(
            first_name: "Alan",
            last_name: "Turing",
            homepage: "http://wikipedia.org/Alan_Turing"
        )
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.name).to eq("Alan Turing")
        expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
    end

    it "is not created without a last name" do
        author = Author.new(
            first_name: "Alan",
            homepage: "http://wikipedia.org/Alan_Turing"
        )
        expect(author).to_not be_valid
    end

    it "is updated properly" do
        author = Author.new(
            first_name: "Alan",
            last_name: "Turing",
            homepage: "http://wikipedia.org/Alan_Turing"
        )
        author.update(
            first_name: "Ada",
            last_name: "Lovelace",
            homepage: "http://wikipedia.org/Ada_Lovelace"
        )   
        expect(author.first_name).to eq("Ada")
        expect(author.last_name).to eq("Lovelace")
        expect(author.name).to eq("Ada Lovelace")
        expect(author.homepage).to eq("http://wikipedia.org/Ada_Lovelace")
    end

    it "is not updated without a last name" do
        author = Author.new(
            first_name: "Alan",
            last_name: "Turing",
            homepage: "http://wikipedia.org/Alan_Turing"
        )
        author.update(
            first_name: "Ada",
            last_name: nil,
            homepage: "http://wikipedia.org/Ada_Lovelace"
        )
        expect(author).to_not be_valid
    end

    it "has an empty list of papers" do
        author = Author.new(
            first_name: "Alan",
            last_name: "Turing",
            homepage: "http://wikipedia.org/Alan_Turing"
        )
        expect(author.papers).to be_empty
    end
  end