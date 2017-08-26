module Adminlte
  module NavigationHelper
    def render_navigation
      render 'adminlte/layouts/sidebar', items: adminlte_config(:navigation).items
    end

    def navigation_normalize_property(obj)
      obj.respond_to?(:call) ? instance_exec(&obj) : obj
    end

    def navigation_icon(item)
      if item.icon.present?
        classes = ['fa', "fa-#{item.icon}"]
        classes << "text-#{item.color}" if item.color.present?

        content_tag(:i, '', class: classes.join(' '))
      end
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

    def navigation_labels(item)
      return if item.labels.empty?

      content_tag :div, class: 'pull-right-container' do
        item.labels.reverse.each do |label|
          label = { value: label } unless label.is_a? Hash

          label[:color] ||= item.color
          classes = ['label', 'pull-right']
          classes << "bg-#{label[:color]}" if label[:color].present?

          concat content_tag :small, navigation_normalize_property(label[:value]), class: classes.join(' ')
        end
      end
    end

    private

    def navigation_active_array(options)
      case options.length
      when 1
        options[0].to_s == controller_path
      when 2
        options[0].to_s == controller_path && options[1].to_s == action_name
      else
        false
      end
    end

    def navigation_active_hash(options)
      options = options.with_indifferent_access
      options[controller_path].present? && [*options[controller_path]].map(&:to_s).include?(action_name)
    end
  end
end
