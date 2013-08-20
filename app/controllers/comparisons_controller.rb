class ComparisonsController < ApplicationController
  def index
    @comparisons = Comparison.paginate(:page => params[:page], :per_page => 30, :order => "created_at desc")
  end

  def new
    @institution = Institution.find(params[:institution_id])
    @comparison = Comparison.new
  end

  def create
    @comparison = Comparison.new(params[:comparison])
    @peer_group = @comparison.peer_group

    if params[:save].eql?("1") then
      @comparison.save

      if @comparison.valid? then
        redirect_to comparison_path(@comparison)
      else
        render :create
      end
      
    else
      respond_to do |format|
        format.html
        format.js
        format.csv
      end
    end
  end

  def show
    @comparison = Comparison.find(params[:id])
    @peer_group = @comparison.peer_group
  end

  def delete
    @comparison = Comparison.find(params[:id])
  end

end