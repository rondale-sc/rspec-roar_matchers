# Rspec::RoarMatchers

Rspec::RoarMatchers is a collection of matchers designed to enforce a contract between your spec and representer.  The driving concern while recently developing for an app that was making extensive use of Roar, was the fact that we were able to modify the various representers without the spec complaining.

So to ensure that any change to the representation of an object was explicit we made a few rspec matchers to do the heavy lifting.

# Usage

Below are the matchers we've defined thus far (will likely be expanding).  For more information regarding implementation see `spec/roar_matchers/matchers_spec.rb`.  

The will enforce bi-directionally.  This means that it will fail if:

* if a property/collection/link is present in the representer but not in the spec
* if a property/collection/link is present in the spec but not in the representer

All of these matchers receive a word array as an argument.

### have_collections

```ruby
context "collection is present in both spec and representer (happy path)" do
  it "passes" do
    expected_collections = %w{state_or_provinces}
    expect(country.extend(CountryRepresenter)).to have_collections(expected_collections)
  end
end
```

### have_links

```ruby
context "link is present in both spec and representer (happy path)" do
  it "passes" do
    expected_links = %w{self}
    expect(country.extend(CountryRepresenter)).to have_links(expected_links)
  end
end
```

### have_properties

```ruby
context "property is present in both spec and representer (happy path)" do
  it "passes" do
    expected_properties = %w{name}
    expect(country.extend(CountryRepresenter)).to have_properties(expected_properties)
  end
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-roar_matchers'

And then execute:

    $ bundle

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
