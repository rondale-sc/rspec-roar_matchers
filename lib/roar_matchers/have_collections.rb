RSpec::Matchers.define :have_collections do |expected_collections|
  match do |representer|
    first = expected_collections.all? do |expected_collection|
      RoarMatchers.get_actual_collection_names(representer).include?(expected_collection)
    end

    second = RoarMatchers.get_actual_collection_names(representer).all? do |expected_collection|
      expected_collections.include?(expected_collection)
    end

    first && second
  end

  failure_message do |representer|
    actual_collection_names = RoarMatchers.get_actual_collection_names(representer)
    representation_or_specification, missing = RoarMatchers.missing(actual_collection_names, expected_collections)

    (<<-EOS)
      expected that #{actual_collection_names}

      should contain #{expected_collections}

      missing collection(s) from #{representation_or_specification}: #{missing}
    EOS
  end
end
