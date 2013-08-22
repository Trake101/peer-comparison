class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :unit_id
      t.string :inst_name
      t.float :f1_size
      t.float :f2_cost
      t.float :f3_access
      t.float :f4_salary
      t.float :f5_libarts
      t.float :f6_ugcomp
      t.float :f7_expend
      t.string :state
      t.string :fips
      t.string :sector
      t.string :control
      t.string :deg_grant
      t.string :hbcu
      t.string :tribal
      t.string :locale
      t.string :land_grant
      t.string :carnegie
      t.string :year

      t.timestamps
    end
  end
end
