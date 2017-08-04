module Adminlte
  module ResourceHelper
    def icon(name, options = {})
      options[:class] ||= ''
      options[:class] << " fa fa-#{name}"

      content_tag :span, '', options
    end

    def sortable_handler(resource, url)
      icon('arrows', class: 'js-sortable-data', data: { position: resource.position, url: url })
    end

    def adminlte_sortable_col(title, name)
      html_options  = { class: 'sort' }
      direction     = 'asc'

      if params[:sort] == name.to_s
        if params[:dir] == 'desc'
          html_options[:class]  = 'sort_desc'
          direction             = 'asc'
        else
          html_options[:class]  = 'sort_asc'
          direction             = 'desc'
        end
      end

      link_to title, request.GET.merge(sort: name, dir: direction), html_options
    end

    def adminlte_search_form
      render 'search_form'
    end
  end
end
