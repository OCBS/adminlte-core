require 'adminlte/core/navigation_item'

module Adminlte
  module Core
    class Navigation
      attr_accessor :items

      def initialize
        @items = []
      end

      def item(title, url, **options)
        new_item = NavigationItem.new title, url, default_options.merge(options)

        items << new_item

        yield(new_item.navigation) if block_given?
      end

      private

      def default_options
        { if: nil, active_if: nil, icon: nil, color: nil }
      end
    end
  end
end
