module Adminlte
  module LabelHelper
    def published_label(resource)
      if resource.published?
        content_tag :span, 'Опубликовано', class: 'label label-success'
      else
        content_tag :span, 'Не опубликовано', class: 'label label-default'
      end
    end

    def status_label(value, true_text, false_text)
      if value
        content_tag :span, true_text, class: 'label label-success'
      else
        content_tag :span, false_text, class: 'label label-default'
      end
    end

    def success_label(text)
      content_tag :span, text, class: 'label label-success'
    end

    def custom_label(text, class_name = 'default')
      content_tag :span, text, class: "label label-#{class_name}"
    end

    def sortable_handler(resource, url)
      content_tag :span, '', class: 'js-sortable-data fa fa-arrows', data: { position: resource.position, url: url }
    end
  end
end
