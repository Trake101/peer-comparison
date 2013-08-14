class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all(:order => :f7_expend)
  end

  def show

  end
end