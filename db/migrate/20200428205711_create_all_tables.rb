class CreateAllTables < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code, index: true
      t.string :hospital_type
      t.string :total_beds, index: true
      t.string :county
      t.string :county_fips_code
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :naics_code
      t.string :website
      t.string :owner
      t.string :trauma, index: true
      t.string :helipad
      t.timestamps
    end
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :mrn, index: true
      t.string :zip_code, index: true
      t.string :patient_status_code
      t.references :hospital, default: -1
      t.timestamps
    end
    create_table :zip_distances do |t|
      t.string :zip_from, index: true
      t.string :zip_to, index: true
      t.float :distance, index: true
      t.timestamps
    end
  end
end
