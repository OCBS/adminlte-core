module Adminlte
  module NavigationHelper
    def render_navigation
      render 'adminlte/layouts/sidebar', items: adminlte_config(:navigation).items
    end

    def navigation_normalize_property(obj)
      obj.respond_to?(:call) ? instance_exec(&obj) : obj
    end

    def navigation_icon(item)
      content_tag(:i, '', class: "fa fa-#{item.icon}") if item.icon.present?
    end

    def navigation_url(item)
      navigation_normalize_property item.url
    end

    def navigation_show?(item)
      val = navigation_normalize_property(item.if)
      val = true if val.nil?
      val
    end

    def navigation_active?(item)
      val = navigation_normalize_property(item.active_if)

      case val
      when Array
        val = navigation_active_array val
      when Hash
        val = navigation_active_hash val
      when Symbol
        val = navigation_active_array [val]
      when String
        val = navigation_active_array val.split('#')
      end

      val = false if val.nil?
      val
    end

    def navigation_labels(_item)
      []
    end

    private

    def navigation_active_array(options)
      case options.length
      when 1
        options[0].to_s == controller_name
      when 2
        options[0].to_s == controller_name && options[1].to_s == action_name
      else
        false
      end
    end

    def navigation_active_hash(options)
      options = options.with_indifferent_access
      options[controller_name].present? && [*options[controller_name]].map(&:to_s).include?(action_name)
    end
  end
end
