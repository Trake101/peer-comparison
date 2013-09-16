class AddGeoInformationToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :address, :string
    add_column :institutions, :city, :string
    add_column :institutions, :zip, :string
    add_column :institutions, :website, :string
    add_column :institutions, :county_code, :string
    add_column :institutions, :county, :string
    add_column :institutions, :longitude, :float
    add_column :institutions, :latitude, :float
  end
end
