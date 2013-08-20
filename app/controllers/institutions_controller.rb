class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all(:order => :inst_name)
  end

  def show

  end
end