module Refinery
  module SettingsInitializer
    class Loader
      attr_reader :settings

      def initialize(settings)
        @settings = settings
      end

      def load
        @settings.map do |scope, settings|
          settings.map do |name, value|
            [name, value.merge({:scoping => scope})]
          end
        end.flatten(1).each do |setting|
          RefinerySetting.set(setting.first, setting.last)
        end
      end
    end
  end
end

