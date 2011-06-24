require 'refinerycms-settings-initializer'


# Use this hook to configure devise mailer, warden hooks and so forth. The first
# four configuration values can also be set straight in your models.
::Refinery::SettingsInitializer::Loader.new(
  YAML::load(File.open("#{Rails.root}/config/refinery/settings.yml"))
).load
