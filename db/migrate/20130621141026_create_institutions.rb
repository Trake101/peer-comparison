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

      t.timestamps
    end
  end
end
