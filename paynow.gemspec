require "paynow/version"

Gem::Specification.new do |s|
  s.name                    = 'paynow-zw'
  s.version                 =  Paynow::Version 
  s.summary                 = "Paynow API wrapper for Ruby on Rails"
  s.description             = 'A simple and slightly opinionated Ruby abstraction for the Paynow API in Zimbabwe'
  s.authors                 = ['Bles Muchaya']
  s.email                   = ['btmuchaya@gmail.com']
  s.files                   = Dir['lib/**/*', "LICENSE",  "*.md"]
  s.require_paths           = ['lib']
  s.required_ruby_version   = '>2.4'
  s.homepage                = 'https://rubygems.org/gems/paynow'
  s.license                 = 'MIT'

  s.add_development_dependency "rails", ">=4.2"
end