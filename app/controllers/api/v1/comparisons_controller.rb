module Api
  module V1
    class ComparisonsController < ApplicationController
      respond_to :json

      def index
        respond_with Comparison.all
      end

			def create
				@institution = Institution.find(params[:institution_id].to_i)
				@comparison = Comparison.new(institution_id: @institution.id.to_i, number_of_peers: params[:number_of_peers].to_i)
				@comparison_group = @comparison.comparison_group

				respond_with @comparison_group.collect
			end

    end
  end
end
