module Adminlte
  module Core
    class NavigationItem
      attr_accessor :navigation
      attr_accessor :title, :url, :icon, :color, :labels, :if, :active_if

      delegate :items, to: :navigation

      def initialize(title, url, **options)
        @navigation = Adminlte::Core::Navigation.new

        @title      = title
        @url        = url
        @icon       = options[:icon]
        @color      = options[:color]
        @labels     = [*options[:labels]]
        @if         = options[:if]
        @active_if  = options[:active_if]

        case url
        when Symbol
          url_by_controller_and_action url
        when String
          controller, name = url.split '#'

          url_by_controller_and_action controller, name
        when Array
          url_by_controller_and_action url.shift, url.shift
        end
      end

      def url_by_controller_and_action(controller, action = :index)
        self.url = -> { url_for controller: controller, action: action }
        self.active_if = controller if active_if.nil?
      end
    end
  end
end
