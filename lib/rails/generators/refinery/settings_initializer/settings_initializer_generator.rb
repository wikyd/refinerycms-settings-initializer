module Refinery
  module SettingsInitializer
    module Generators
      class SettingsInitializerGenerator < Rails::Generators::Base
        desc 'Creates a RefinerySetting initializer to load RefinerySettings from a configuration file.'

        def self.source_root
          @_refinerycms_settigs_initializer_source_root ||= File.expand_path("../templates", __FILE__)
        end

        def create_config_file
          template 'settings.yml', File.join('config', 'refinery', 'settings.yml')
        end

        def create_initializer_file
          template 'refinerycms_settings.rb', File.join('config', 'initializers', 'refinerycms_settings.rb')
        end
      end
    end
  end
end

