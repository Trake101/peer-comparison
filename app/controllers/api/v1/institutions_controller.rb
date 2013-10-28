module Api
  module V1
		class InstitutionsController < ApplicationController

			respond_to :json

		  def index
		    @institutions = Institution.all(:order => :inst_name)

		    respond_with @institutions, only: [:inst_name, :unit_id], status: 200
		  end

		end
	end
end