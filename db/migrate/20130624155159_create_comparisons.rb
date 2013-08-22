class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.string :title
      t.text :notes
      t.integer :institution_id
      t.float :f1_weight, :default => 1.0
      t.float :f2_weight, :default => 1.0
      t.float :f3_weight, :default => 1.0
      t.float :f4_weight, :default => 1.0
      t.float :f5_weight, :default => 1.0
      t.float :f6_weight, :default => 1.0
      t.float :f7_weight, :default => 1.0
      t.integer :number_of_peers, :default => 10
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

      t.timestamps
    end
  end
end
