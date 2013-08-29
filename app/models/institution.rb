class Institution < ActiveRecord::Base
  include ApplicationHelper

  attr_accessible :f1_size, :f2_cost, :f3_access, :f4_salary, :f5_libarts, :f6_ugcomp, :f7_expend, :c, :inst_name, :unit_id,
  :state, :fips, :sector, :control, :deg_grant, :hbcu, :tribal, :locale, :land_grant, :carnegie, :year
  has_many :comparisons

  def distance_from(institution, comp)
    ((self.f1_size     - institution.f1_size)**2) * comp.f1_weight + 
    ((self.f2_cost     - institution.f2_cost)** 2) * comp.f2_weight +
    ((self.f3_access   - institution.f3_access )** 2) * comp.f3_weight +
    ((self.f4_salary   - institution.f4_salary )** 2) * comp.f4_weight +
    ((self.f5_libarts  - institution.f5_libarts )** 2) * comp.f5_weight +
    ((self.f6_ugcomp   - institution.f6_ugcomp )** 2) * comp.f6_weight +
    ((self.f7_expend   - institution.f7_expend )** 2) * comp.f7_weight
  end

  def comparison_group(comp)
    return Institution.where(["id <> ?", self.id]).sort_by {|inst| inst.distance_from(self, comp)}[0..10]
  end

  def factor_string
    "#{self.f1_size}, #{self.f2_cost}, #{self.f3_access}, #{self.f4_salary}, 
    #{self.f5_libarts}, #{self.f6_ugcomp}, #{self.f7_expend}"
  end

  def factor_diff_string(institution, comp)
    "#{(self.f1_size - institution.f1_size) * comp.f1_weight},  #{(self.f2_cost - institution.f2_cost) * comp.f2_weight}, #{(self.f3_access - institution.f3_access) * comp.f3_weight}, #{(self.f4_salary - institution.f4_salary) * comp.f4_weight}, #{(self.f5_libarts - institution.f5_libarts) * comp.f5_weight},  #{(self.f6_ugcomp - institution.f6_ugcomp) * comp.f6_weight}, #{(self.f7_expend - institution.f7_expend) * comp.f7_weight}"
  end


  def self.select_options
    return Institution.order(:inst_name).collect{|i| [i.inst_name, i.id]}
  end

  def self.select_options_for(attr)
    return Institution.select("distinct #{attr}").collect{|i| [Institution.characteristic_lookup(attr, i.send(attr)), i.send(attr)]}.sort { |a, b| a[0] <=> b[0] }
  end

  def self.characteristic_lookup(characteristic, code)
    case(characteristic)
      when :fips        then  decode_fips(code)
      when :sector      then  decode_sector(code)
      when :deg_grant   then  decode_deg_grant(code)
      when :hbcu        then  decode_hcbu(code)
      when :locale      then  decode_locale(code)
      when :land_grant  then  decode_land_grant(code)
      when :carnegie    then  decode_carnegie(code)
      else return code
    end
  end

  def self.decode_fips(code)
    case(code)
      when "1" then 'Alabama'
      when "2" then 'Alaska'
      when "4" then 'Arizona'
      when "5" then 'Arkansas'
      when "6" then 'California'
      when "8" then 'Colorado'
      when "9" then 'Connecticut'
      when "10" then 'Delaware'
      when "11" then 'District of Columbia'
      when "12" then 'Florida'
      when "13" then 'Georgia'
      when "15" then 'Hawaii'
      when "16" then 'Idaho'
      when "17" then 'Illinois'
      when "18" then 'Indiana'
      when "19" then 'Iowa'
      when "20" then 'Kansas'
      when "21" then 'Kentucky'
      when "22" then 'Louisiana'
      when "23" then 'Maine'
      when "24" then 'Maryland'
      when "25" then 'Massachusetts'
      when "26" then 'Michigan'
      when "27" then 'Minnesota'
      when "28" then 'Mississippi'
      when "29" then 'Missouri'
      when "30" then 'Montana'
      when "31" then 'Nebraska'
      when "32" then 'Nevada'
      when "33" then 'New Hampshire'
      when "34" then 'New Jersey'
      when "35" then 'New Mexico'
      when "36" then 'New York'
      when "37" then 'North Carolina'
      when "38" then 'North Dakota'
      when "39" then 'Ohio'
      when "40" then 'Oklahoma'
      when "41" then 'Oregon'
      when "42" then 'Pennsylvania'
      when "44" then 'Rhode Island'
      when "45" then 'South Carolina'
      when "46" then 'South Dakota'
      when "47" then 'Tennessee'
      when "48" then 'Texas'
      when "49" then 'Utah'
      when "50" then 'Vermont'
      when "51" then 'Virginia'
      when "53" then 'Washington'
      when "54" then 'West Virginia'
      when "55" then 'Wisconsin'
      when "56" then 'Wyoming'
      when "60" then 'American Samoa'
      when "64" then 'Federated States of Micronesia'
      when "66" then 'Guam'
      when "68" then 'Marshall Islands'
      when "69" then 'Northern Marianas'
      when "70" then 'Palau'
      when "72" then 'Puerto Rico'
      when "78" then 'Virgin Islands'
      else return 'Unknown'    
    end
  end  

  def self.decode_sector(code)
    case(code)
      when "0" then 'Administrative Unit'
      when "1" then 'Public, 4-year or above'
      when "2" then 'Private not-for-profit, 4-year or above'
      when "3" then 'Private for-profit, 4-year or above'
      when "4" then 'Public, 2-year'
      when "5" then 'Private not-for-profit, 2-year'
      when "6" then 'Private for-profit, 2-year'
      when "7" then 'Public, less-than 2-year'
      when "8" then 'Private not-for-profit, less-than 2-year'
      when "9" then 'Private for-profit, less-than 2-year'
      when "99" then 'Sector unknown (not active)'
      else return 'Unknown'
    end
  end

  def self.decode_deg_grant(code)
    case(code)
      when "1" then 'Degree-granting'
      when "2" then 'Nondegree-granting, primarily postsecondary'
      when "-3" then 'Not available'
      else 'Unknown'
    end
  end

  def self.decode_hcbu(code)
    case(code)
      when "1" then 'Yes'
      else 'No'
    end
  end

  def self.decode_locale(code)
    case(code)
      when "11" then 'City: Large'
      when "12" then 'City: Midsize'
      when "13" then 'City: Small'
      when "21" then 'Suburb: Large'
      when "22" then 'Suburb: Midsize'
      when "23" then 'Suburb: Small'
      when "31" then 'Town: Fringe'
      when "32" then 'Town: Distant'
      when "33" then 'Town: Remote'
      when "41" then 'Rural: Fringe'
      when "42" then 'Rural: Distant'
      when "43" then 'Rural: Remote'
      when "-3" then 'Not available'
      else 'Unknown'
    end
  end

  def self.decode_land_grant(code)
    case(code)
      when "1" then 'Yes'
      else 'No'
    end
  end 

  def self.decode_carnegie(code)
    case(code)
      when "15" then 'Doctoral/Research Universities--Extensive'
      when "16" then 'Doctoral/Research Universities--Intensive'
      when "21" then 'Masters Colleges and Universities I'
      when "22" then 'Masters Colleges and Universities II'
      when "31" then 'Baccalaureate Colleges--Liberal Arts'
      when "32" then 'Baccalaureate Colleges--General'
      when "33" then 'Baccalaureate/Associates Colleges'
      when "40" then 'Associates Colleges'
      when "51" then 'Theological seminaries and other specialized faith-related institcaseutions'
      when "52" then 'Medical schools and medical centers'
      when "53" then 'Other separate health profession schools'
      when "54" then 'Schools of engineering and technology'
      when "55" then 'Schools of business and management'
      when "56" then 'Schools of art, music, and design'
      when "57" then 'Schools of law'
      when "58" then 'Teachers colleges'
      when "59" then 'Other specialized institutions'
      when "60" then 'Tribal colleges'
      when "-3" then 'Item not available'
      else 'Unknown'
    end
  end 
end
