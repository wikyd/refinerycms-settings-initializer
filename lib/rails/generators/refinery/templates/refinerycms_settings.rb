require 'refinerycms-setting-initializer'

# Use this hook to configure devise mailer, warden hooks and so forth. The first
# four configuration values can also be set straight in your models.
::Refinery::SettingIntiailizer::Loader.new(
  YAML::load(File.open("../refinery/settings.yml"))
).load
