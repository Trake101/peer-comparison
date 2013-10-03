FactoryGirl.define do
  factory :institution do
    unit_id "654321"
    inst_name "The University of Minnesota - Twin Cities"
    f1_size 10.0
    f2_cost 10.0
    f3_access 10
    f4_salary 10
    f5_libarts 10
    f6_ugcomp 10
    f7_expend 10
    state ""
    fips ""
    sector ""
    control ""
    deg_grant ""
    hbcu ""
    tribal ""
    locale ""
    land_grant ""
    carnegie ""
    year ""
    address ""
    city ""
    zip ""
    website ""
    county_code ""
    county ""
    longitude ""
    latitude ""
  end

  factory :comparison do
    f1_weight 2
    f2_weight 2
    f3_weight 2 
    f4_weight 2
    f5_weight 2
    f6_weight 2
    f7_weight 2
    number_of_peers 0
    association :institution, factory: :institution
  end
end