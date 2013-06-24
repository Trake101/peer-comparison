class Institution < ActiveRecord::Base
  attr_accessible :f1_size, :f2_cost, :f3_access, :f4_salary, :f5_libarts, :f6_ugcomp, :c, :inst_name, :unit_id
  has_many :comparisons

  def distance_from(institution, comp)
    ((self.f1_size     - institution.f1_size)**2) * comp.f1_weight + 
    ((self.f2_cost     - institution.f2_cost)** 2) * comp.f2_weight +
    ((self.f3_access   - institution.f3_access )** 2) * comp.f3_weight +
    ((self.f4_salary   - institution.f4_salary )** 2) * comp.f4_weight +
    ((self.f5_libarts  - institution.f5_libarts )** 2) * comp.f5_weight +
    ((self.f6_ugcomp   - institution.f6_ugcomp )** 2) * comp.f6_weight +
    ((self.f6_ugcomp   - institution.f6_ugcomp )** 2) * comp.f7_weight
  end

  def peer_group(comp)
    return Institution.where(["id <> ?", self.id]).sort_by {|inst| inst.distance_from(self, comp)}[0..10]
  end

  def self.select_options
    return Institution.order(:inst_name).collect{|i| [i.inst_name, i.id]}
  end
end
