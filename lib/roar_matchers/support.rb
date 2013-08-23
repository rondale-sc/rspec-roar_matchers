module RoarMatchers
  def self.missing(actual,expected)
    if (mp = (expected - actual)).any?
      ["Representer", mp]
    else
      ["Spec", actual - expected]
    end
  end

  def self.get_actual_property_names(representer)
    representer.instance_variable_get("@representable_attrs").reject do |attr|
      attr.options[:collection]
    end.map(&:name)
  end

  def self.get_actual_link_names(representer)
    representer.to_json;
    representer.links.keys
  end

  def self.get_actual_collection_names(representer)
    representer.instance_variable_get("@representable_attrs").select do |attr|
      attr.options[:collection] && attr.name != "links_array"
    end.map(&:name)
  end
end
