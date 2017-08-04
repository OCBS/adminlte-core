module Adminlte
  module BaseController
    extend ActiveSupport::Concern

    included do
      layout 'adminlte/layouts/application'
    end

    module ClassMethods
      def local_prefixes
        [controller_path, 'adminlte/application']
      end
    end
  end
end
