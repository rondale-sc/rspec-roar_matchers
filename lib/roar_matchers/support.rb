module RoarMatchers
  def self.missing(actual,expected)
    if (mp = (expected - actual)).any?
      ["Representer", mp]
    else
      ["Spec", actual - expected]
    end
  end

  def self.get_actual_property_names(representer)
    representer.instance_variable_get("@representable_attrs").reject do |key, attrs|
      attrs.options[:collection]
    end.keys
  end

  def self.get_actual_link_names(representer, options={})
    representer.to_json(options);
    representer.links.keys
  end

  def self.extract_options!(args)
    args.last.is_a?(::Hash) ? args.pop : {}
  end

  def self.get_actual_collection_names(representer)
    representer.instance_variable_get("@representable_attrs").select do |key, attrs|
      attrs.options[:collection] && attrs.name != "links_array"
    end.keys
  end
end
