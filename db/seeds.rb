# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

ZipDistance.insert_all(CSV.foreach('db/kyzipdistance.csv').drop(1).map { |row|
  {
    'zip_from': row[0],
    'zip_to': row[1],
    'distance': row[2].to_f,
    'created_at': Time.now,
    'updated_at': Time.now
  }
})
Hospital.insert_all(CSV.foreach('db/hospitals.csv').drop(1).map { |row|
  {
    'id': row[0].to_i,
    'name': row[1],
    'address': row[2],
    'city': row[3],
    'state': row[4],
    'zip_code': row[5],
    'hospital_type': row[6],
    'total_beds': row[7],
    'county': row[8],
    'county_fips_code': row[9],
    'country': row[10],
    'latitude': row[11],
    'longitude': row[12],
    'naics_code': row[13],
    'website': row[14],
    'owner': row[15],
    'trauma': row[16],
    'helipad': row[17],
    'created_at': Time.now,
    'updated_at': Time.now
  }
})

# These assignments are kept in the hospital database for simplicity.
Hospital.create(id: 0, name: 'Home assignment')
Hospital.create(id: -1, name: 'No assignment')
