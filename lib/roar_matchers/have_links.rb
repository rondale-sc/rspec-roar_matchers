RSpec::Matchers.define :have_links do |*expected|
  expected_links = expected.shift
  options = RoarMatchers.extract_options!(expected)

  match do |representer|
    first = expected_links.all? do |expected_link|
      RoarMatchers.get_actual_link_names(representer, options).include?(expected_link)
    end

    second = RoarMatchers.get_actual_link_names(representer, options).all? do |expected_link|
      expected_links.include?(expected_link)
    end

    first && second
  end

  failure_message_for_should do |representer|
    opts = opts || {}

    actual_link_names = RoarMatchers.get_actual_link_names(representer, opts)
    representation_or_specification, missing = RoarMatchers.missing(actual_link_names,expected_links)

    (<<-EOS)
      expected that #{actual_link_names}

      should contain #{expected_links}

      missing links from #{representation_or_specification}: #{missing}
    EOS
  end
end
