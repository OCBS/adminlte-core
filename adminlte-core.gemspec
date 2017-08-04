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

  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'jquery-ui-rails'
  spec.add_dependency 'turbolinks'

  spec.add_dependency 'inherited_resources'
  spec.add_dependency 'has_scope'
  spec.add_dependency 'kaminari'
  spec.add_dependency 'acts_as_list'
  spec.add_dependency 'formtastic'
  spec.add_dependency 'formtastic-bootstrap'
end
