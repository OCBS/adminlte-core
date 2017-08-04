module Adminlte
  module ResourceLinksHelper
    def external_link(url, text = nil)
      link_to(url, target: '_blank', class: 'btn btn-info btn-xs') do
        safe_join [icon('external-link'), ' ', text]
      end
    end

    def new_link(text = 'Создать', **html_options)
      link_to(text, new_resource_path, { class: 'btn btn-primary btn-sm' }.merge(html_options))
    end

    def show_link(resource)
      link_to(icon('eye'), resource_path(resource), class: 'btn btn-primary btn-xs')
    end

    def edit_link(resource)
      link_to(icon('pencil'), edit_resource_path(resource), class: 'btn btn-primary btn-xs')
    end

    def destroy_link(resource)
      link_to(icon('trash-o'), resource_path(resource), method: :delete, data: { confirm: 'Вы уверены?' },
                                                        class: 'btn btn-xs btn-danger')
    end

    def edit_and_destroy_links(resource)
      safe_join [edit_link(resource), ' ', destroy_link(resource)]
    end
  end
end
