RSpec::Matchers.define :have_properties do |expected_properties|
  match do |representer|
    first = expected_properties.all? do |expected_property|
      RoarMatchers.get_actual_property_names(representer).include?(expected_property)
    end

    second = RoarMatchers.get_actual_property_names(representer).all? do |expected_property|
      expected_properties.include?(expected_property)
    end

    first && second
  end

  failure_message_for_should do |representer|
    actual_property_names = RoarMatchers.get_actual_property_names(representer)
    representation_or_specification, missing = RoarMatchers.missing(actual_property_names,expected_properties)

    (<<-EOS)
      expected that #{actual_property_names}

      should contain #{expected_properties}

      missing properties from #{representation_or_specification}: #{missing}
    EOS

  end
end
