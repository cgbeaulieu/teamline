config = YAML.load(File.read(File.expand_path('../api_keys.yml', __FILE__)))
config.merge! config.fetch(Rails.env, {})
config.each do |key, value|
  ENV[key] = value.to_s unless value.kind_of? Hash
end
