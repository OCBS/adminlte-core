module Adminlte
  module ApplicationHelper
    def adminlte_config(name)
      Adminlte::Core.configuration.send name
    end

    def adminlte_title(text = nil)
      @admin_title = text if text
      @admin_title
    end

    def adminlte_action(text = nil)
      @admin_action = text if text
      @admin_action
    end

    def adminlte_datetime(time)
      time.present? ? l(time, format: '%d.%m.%Y %H:%M') : '—'
    end

    def adminlte_date(time)
      time.present? ? l(time, format: '%d.%m.%Y') : '—'
    end

    def adminlte_paginate(collection)
      paginate collection, views_prefix: 'adminlte'
    end
  end
end
