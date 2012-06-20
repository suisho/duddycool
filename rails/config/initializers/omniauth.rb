Rails.application.config.middleware.use OmniAuth::Builder do
  yml = File.read("#{Rails.root}/config/oauth.yml")
  setting = YAML.load(yml)
  #provider :developer unless Rails.env.production?
  provider :twitter, setting["twitter"]["key"], setting["twitter"]["secret"]
end
