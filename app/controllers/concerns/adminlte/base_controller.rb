module Adminlte
  module BaseController
    extend ActiveSupport::Concern

    included do
      layout 'adminlte/layouts/application'
    end

    module ClassMethods
      def local_prefixes
        ['adminlte/application', controller_path]
      end
    end
  end
end
