# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

# Hpi.destroy_all
Encounter.destroy_all
User.destroy_all

#admin
User.create({ first_name: "Clark", last_name: "Johnson", email: "clarkandkathy@gmail.com", role: 4, password: "Admin1234" })

#patients
10.times do
  fname = Faker::Name.female_first_name
  lname = Faker::Name.last_name
  email = fname + "." + lname + "@patient.com"
  user = User.create({ first_name: fname, last_name: lname, email: email, role: 0, password: "Patient1234" })

  Profile.create(address1: Faker::Address.street_address, address2: "", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, user: user)
end

#physicians
3.times do
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  email = fname + "." + lname + "@doctor.com"
  user = User.create({ first_name: fname, last_name: lname, email: email, role: 3, password: "Physician1234" })

  Profile.create(address1: Faker::Address.street_address, address2: "", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, user: user)
end

patients = User.all.select { |user| user.role == "patient" }
physicians = User.all.select { |user| user.role == "physician" }

e1 = Encounter.create(patient: patients[0], provider: physicians[0], complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e1.create_hpi

e2 = Encounter.create(patient: patients[2], provider: physicians[1], complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e2.create_hpi

e3 = Encounter.create(patient: patients[4], provider: physicians[2], complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e3.create_hpi

e4 = Encounter.create(patient: patients[6], provider: physicians[0], complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e4.create_hpi
