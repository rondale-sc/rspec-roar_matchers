module CountryRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :name

  collection :state_or_provinces, extend: StateRepresenter, class: State

  link :self do
    "Generic link"
  end
end
