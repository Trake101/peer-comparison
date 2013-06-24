class HomeController < ApplicationController
  def index
    @institutions = Institution.order(:inst_name).collect{|i| [i.inst_name, i.id]}
    @comparison = Comparison.new
  end

  def methodology

  end

  def faq

  end

  def about

  end

  def contact

  end
end