module Adminlte
  module BatchActions
    extend ActiveSupport::Concern

    included do
      def batch
        method = "batch_#{params[:batch_action]}"

        send method if respond_to? method

        head :ok
      end

      def batch_destroy
        batch_collection.destroy_all
      end

      def batch_publish
        batch_collection.each do |r|
          r.update_attributes published: true
        end
      end

      def batch_unpublish
        batch_collection.each do |r|
          r.update_attributes published: false
        end
      end

      protected

      def batch_collection
        collection.where(id: params[:ids])
      end
    end
  end
end
