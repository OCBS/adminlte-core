module Adminlte
  module SortAction
    extend ActiveSupport::Concern

    included do
      def sort
        resource.insert_at(params[:position].to_i + 1)

        head :ok
      end

      private

      def end_of_association_chain
        super.reorder(:position)
      end
    end
  end
end
