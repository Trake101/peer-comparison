class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all(:order => :inst_name)
  end

  def show
    @institution = Institution.find(params[:id])
  end
end