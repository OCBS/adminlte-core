module Adminlte
  module ResourceActions
    extend ActiveSupport::Concern

    included do
      # include Adminlte::ApplicationHelper

      inherit_resources

      def create
        create! do |success, _failure|
          if params[:close].present?
            success.html { redirect_to collection_path }
          else
            success.html { redirect_to edit_resource_path } unless request.xhr?
          end
        end
      end

      def update
        update! do |success, _failure|
          if params[:close].present?
            success.html { redirect_to collection_path }
          else
            success.html { redirect_to edit_resource_path } unless request.xhr?
          end
        end
      end

      protected

      def permitted_params
        params.permit!
      end
    end
  end
end
