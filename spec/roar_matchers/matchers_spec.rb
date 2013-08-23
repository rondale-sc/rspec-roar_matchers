require 'spec_helper'

describe "RSpec::Matchers" do
  describe "#have_collection" do
    let(:country) do
      Country.new("Canada", [State.new("Ontario")])
    end

    context "collection is present in both spec and representer (happy path)" do
      it "passes" do
        expected_collections = %w{state_or_provinces}
        expect(country.extend(CountryRepresenter)).to have_collections(expected_collections)
      end
    end

    context "when collection is absent in representer" do
      it "fails and returns message about where to look" do
        expect do
          country.extend(CountryRepresenter).should have_collections(["not_in_representer"])
        end.to raise_error(/missing collection\(s\) from Representer: \["not_in_representer"\]/)
      end
    end
  end

  describe "#have_links" do
    let(:country) do
      Country.new("United States",  [State.new("Florida")])
    end

    context "link is present in both spec and representer (happy path)" do
      it "passes" do
        expected_links = %w{self}
        expect(country.extend(CountryRepresenter)).to have_links(expected_links)
      end
    end

    context "when collection is absent in representer" do
      it "fails and returns message about where to look" do
        expect do
          country.extend(CountryRepresenter).should have_links(["not_in_representer"])
        end.to raise_error(/missing links from Representer: \["not_in_representer"\]/)
      end
    end
  end

  describe "#have_properties" do
    let(:country) do
      Country.new("United States",  [State.new("Florida")])
    end

    context "link is present in both spec and representer (happy path)" do
      it "passes" do
        expected_properties = %w{name}
        expect(country.extend(CountryRepresenter)).to have_properties(expected_properties)
      end
    end

    context "when property is absent in representer" do
      it "fails and returns message about where to look" do
        expect do
          country.extend(CountryRepresenter).should have_properties(["not_in_representer"])
        end.to raise_error(/missing properties from Representer: \["not_in_representer"\]/)
      end
    end
  end
end
