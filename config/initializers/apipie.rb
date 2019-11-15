Apipie.configure do |config|
  config.app_name                = 'Connepi Researchers Api'
  config.api_base_url            = '/api'
  config.doc_base_url            = '/apipie'
  config.app_info                = 'Connepi Researchers API'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.validate = false
  config.translate = false
end
