# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adminlte/core/version'

Gem::Specification.new do |spec|
  spec.name          = 'adminlte-core'
  spec.version       = Adminlte::Core::VERSION
  spec.authors       = ['Stanislav Fesenko']
  spec.email         = ['iamdeuterium@gmail.com']

  spec.summary       = 'AdminLTE core for rails application'
  spec.homepage      = 'http://iamdeuterium.ru'
  spec.license       = 'MIT'

  spec.require_paths = ['lib']
end
