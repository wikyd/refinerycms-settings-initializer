module Refinery
  module SettingsInitializer
    class Loader
      attr_reader :settings

      def initialize(settings)
        @settings = settings
      end

      def load
        settings.map do |scope, children|
          children.map do |name, value|
            [name, transform_value(value, scope)]
          end
        end.flatten(1).each do |name, options|
          RefinerySetting.set(name, options)
        end
      end

      private
      def transform_value(value, scope)
        value = symbolize_keys(value)
        scope == 'unscoped' ? value : value.merge({:scoping => scope})
      end

      def symbolize_keys(value)
        Hash[value.map{|k, v| [k.to_sym, v]}]
      end
    end
  end
end

