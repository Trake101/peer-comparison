class Comparison < ActiveRecord::Base
  attr_accessible :f1_weight, :f2_weight, :f3_weight, :f4_weight, :f5_weight, :f6_weight, :f7_weight, :institution_id, :notes, :title, :number_of_peers
  belongs_to :institution

  validates :f1_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0.0}
  validates :f2_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f3_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f4_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f5_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f6_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :f7_weight, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :number_of_peers, :presence => true
  validates :institution, :presence => true

  def peer_group
    return Institution.where(["id <> ?", self.institution.id]).sort_by {|inst| inst.distance_from(self.institution, self)}[0..self.number_of_peers]
  end  

  def weights
    return "F1(Size): #{self.f1_weight}; F2(Cost): #{self.f2_weight}; F3(Access): #{self.f3_weight};
    F4 (Salary): #{self.f4_weight}; F5 (Lib Arts): #{self.f5_weight}; F6(UG Comp): #{self.f6_weight};
    F7 (Expenditures): #{self.f7_weight}"
  end
end
