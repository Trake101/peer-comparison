class Comparison < ActiveRecord::Base
  attr_accessible :f1_weight, :f2_weight, :f3_weight, :f4_weight, :f5_weight, :f6_weight, :f7_weight, :institution_id, :notes, :title, :number_of_peers,
  :state, :fips, :sector, :control, :deg_grant, :hbcu, :tribal, :locale, :land_grant, :carnegie
  belongs_to :institution

  CHARACTERISTIC_FILTERS = [:fips, :sector, :deg_grant, :hbcu, :locale, :land_grant, :carnegie]

  validates :f1_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0.0}
  validates :f2_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f3_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f4_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f5_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f6_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f7_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :institution, :presence => true

  def comparison_group
    # Build lazy loaded query based on inputs
    p = Institution.where(["id <> ?", self.institution.id])

    # Apply current filters
    CHARACTERISTIC_FILTERS.each do |f|
      p = p.where(f => self.send(f)) if !self.send(f).blank?
    end

    # Sort by distanct
    p = p.sort_by {|inst| inst.distance_from(self.institution, self)}[0..self.clean_number_of_peers-1]

    return p
  end

  def filtered?
    CHARACTERISTIC_FILTERS.any?{|f| !self.send(f).blank?}
  end

  def current_filters
    CHARACTERISTIC_FILTERS.select{|f| !self.send(f).blank?}
  end

  def weights
    return "Size: x#{self.f1_weight.to_i}; Cost: x#{self.f2_weight.to_i}; Access: x#{self.f3_weight.to_i};
    Salary: x#{self.f4_weight.to_i}; Lib Arts: x#{self.f5_weight.to_i}; UG Comp: x#{self.f6_weight.to_i};
    Expenditures: x#{self.f7_weight.to_i}"
  end

  def weights_compact
    return "x#{self.f1_weight.to_i} / x#{self.f2_weight.to_i} / x#{self.f3_weight.to_i} / x#{self.f4_weight.to_i}
    / x#{self.f5_weight.to_i} / x#{self.f6_weight.to_i} / x#{self.f7_weight.to_i}"
  end

  def clean_number_of_peers
    if number_of_peers.nil?
      return Institution.count
    else
      return number_of_peers
    end
  end
end
