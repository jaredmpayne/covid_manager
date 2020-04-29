class CreateAllTables < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :hospital_type
      t.string :total_beds
      t.string :county
      t.string :county_fips_code
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :naics_code
      t.string :website
      t.string :owner
      t.string :trauma
      t.string :helipad
      t.timestamps
    end
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :mrn
      t.string :zip_code
      t.string :patient_status_code
      t.references :hospital, default: -1
      t.timestamps
    end
    create_table :zip_distances do |t|
      t.string :zip_from
      t.string :zip_to
      t.float :distance
      t.timestamps
    end
  end
end
