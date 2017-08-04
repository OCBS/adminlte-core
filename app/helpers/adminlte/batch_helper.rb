module Adminlte
  module BatchHelper
    def adminlte_batch_toggle
      content_tag :th, style: 'width: 28px' do
        check_box_tag nil, nil, false, class: 'js-toggle-all'
      end
    end

    def adminlte_batch_col(resource)
      content_tag :td do
        check_box_tag :ids, resource.id
      end
    end

    def adminlte_batch_actions(actions = {}, standard = true)
      actions = actions.merge(publish: 'Опубликовать', unpublish: 'Распубликовать', destroy: 'Удалить') if standard

      content_tag(:div, class: 'btn-group js-batch-actions', data: { url: adminlte_batch_path }) do
        render_batch_actions_button + render_batch_actions_dropdown(actions)
      end
    end

    def adminlte_batch_path
      collection_path + '/batch'
    end

    private

    def render_batch_actions_button
      content_tag(:button, class: 'btn btn-xs btn-default dropdown-toggle', type: 'button',
                           data: { toggle: 'dropdown' }) do
        safe_join ['Групповые действия ', content_tag(:span, '', class: 'caret')]
      end
    end

    def render_batch_actions_dropdown(actions)
      content_tag(:ul, class: 'dropdown-menu') do
        buffer = actions.map do |k, v|
          content_tag(:li) do
            link_to v, '#', data: { action: k }
          end
        end

        safe_join buffer
      end
    end
  end
end
