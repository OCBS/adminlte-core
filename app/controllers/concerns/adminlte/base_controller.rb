module Adminlte
  module BaseController
    extend ActiveSupport::Concern

    included do
      layout 'adminlte/layouts/application'
    end
  end
end
