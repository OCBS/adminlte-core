require 'adminlte/core/navigation'
require 'adminlte/core/configuration'
require 'adminlte/core/version'

module Adminlte
  module Core
    class Engine < ::Rails::Engine
      require 'jquery-rails'
      require 'jquery-ui-rails'
      require 'inherited_resources'
      require 'has_scope'
      require 'acts_as_list'
      require 'kaminari'

      require 'formtastic'
      require 'formtastic-bootstrap'

      Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder
    end

    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new

      yield(configuration)
    end
  end
end
