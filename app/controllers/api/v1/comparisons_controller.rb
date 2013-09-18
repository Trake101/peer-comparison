module Api
  module V1
    class ComparisonsController < ApplicationController
      before_filter :validate_and_set_params, :only => [:new]

      respond_to :json

      def index
        respond_with Comparison.all
      end

			def new
			  @comparison = Comparison.new(institution_id: @institution.id, number_of_peers: @number_of_peers)
			  @comparison_group = @comparison.comparison_group

        respond_with @comparison_group
        
			end

      #error checking request params
      def required_params
        ["unit_id", "number_of_peers"]
      end

      def validate_and_set_params
        #incoming api requests must use IPEDS institution id (unit_id) to identify institution 

        #require that 'unit_id' and 'number_of_peers' params have been supplied
        unless required_params.all?{|p| params.keys.include?(p)}
          respond_with errors: "invalid number of params", status: 442 and return false
        end

        #check if unit_id is valid and not nill
        if !Institution.where(unit_id: params[:unit_id].to_i).first || params[:unit_id].nil?
          respond_with errors: "Invalid or blank IPEDS id (unit_id)", status: 442 and return false
        else
          @institution = Institution.where(unit_id: params[:unit_id].to_i).first
        end
      
        #ensure number of peers is above 0 and below 50
        if params[:number_of_peers].to_i <= 0
          @number_of_peers = 1
        elsif params[:number_of_peers].to_i > 50
          @number_of_peers = 50
        else
          @number_of_peers = params[:number_of_peers].to_i
        end
        
        return true
      end

    end
  end
end
