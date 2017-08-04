module Adminlte
  module FormHelper
    def adminlte_form_for(model, options = {})
      semantic_form_for model, options do |f|
        content_tag :div, class: 'box' do
          concat content_tag(:div, content_tag(:h3, options[:title], class: 'box-title'), class: 'box-header')

          form_output = capture do
            yield(f)
          end

          concat content_tag(:div, form_output, class: 'box-body')
          concat content_tag(:div, adminlte_form_actions(f), class: 'box-footer')
        end
      end
    end

    def adminlte_form_actions(form)
      form.actions do
        safe_join [
          form.action(:submit),
          ' ',
          form.action(:submit, label: 'Сохранить и закрыть', class: 'btn btn-primary', button_html: { name: 'close' })
        ]
      end
    end
  end
end
