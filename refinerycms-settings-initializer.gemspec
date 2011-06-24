# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'refinery/settings_initializer/version'
 
Gem::Specification.new do |s|
  s.name        = "refinerycms-settings-initializer"
  s.version     = Refinery::SettingsInitializer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kyle Wilkinson"]
  s.email       = ["kyle@internmatch.com"]
  s.homepage    = "http://github.com/wikyd/refinerycms-settings-initializer"
  s.summary     = "Configure RefineryCMS settings with a file, instead of by hand."
  s.description = "Adds an initializer to a Rails project using RefineryCMS that reads in a YAML configuration file to initialize RefinerySettings."
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_dependency    'refinerycms-settings',   '~> 1.0.0'
 
  s.files        = Dir.glob("lib/**/*") + %w(LICENSE readme.md changelog.md)
  s.require_path = 'lib'
end

