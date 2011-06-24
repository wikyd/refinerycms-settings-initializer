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
        end.flatten.each do |setting|
          Rails.logger.debug "***** Setting: #{setting.first} to #{setting.second.inspect}"
          RefinerySetting.set(setting.first, setting.last)
        end
      end
    end
  end
end

