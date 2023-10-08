# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do

	

	# 100.times do |i|
	# 	user = User.create(
	# 		first_name: Faker::Name.first_name,
	# 		last_name: Faker::Name.last_name,
	# 		username: "#{Faker::Name.first_name.downcase}_#{i+1}",
	# 		email: Faker::Internet.email,
	# 		contact_number: Faker::PhoneNumber.phone_number_with_country_code,
	# 		street_address: Faker::Address.street_address,
	# 		city: Faker::Address.city,
	# 		state: Faker::Address.state,
	# 		country: Faker::Address.country,
	# 		pincode: Faker::Address.postcode,
	# 		dob: (Date.today + rand(1..30).days) - rand(24..36).years,
	# 		profile_title: User::PROFILE_TITLE.sample,
	# 		password: '123456',
	# 		about: Faker::Lorem.paragraph
	# 	)
	# 	 puts "Users #{i+1} Created successfully"
	# end

	# user_ids=User.pluck(:id)
	# 100.times do |i|
	# 	user = User.find(user_ids[rand(user_ids.length)])
	# 	org=user.organizations.create(
	# 		name: Faker::Name.name ,
	# 		address: Faker::Address.full_address
	# 	)
	# 	puts "Organization #{org.id} Created successfully"
	# end

	# org_ids=Organization.pluck(:id)
	# 100.times do |i|
	# 	org=Organization.find(org_ids[rand(org_ids.length)])
	# 	mgnt=org.managements.create(
	# 		name: Faker::Name.name,
	# 		contact_no: Faker::PhoneNumber.phone_number
	# 	)
	# 	puts "Management id #{mgnt.id} created successfully"
	# end

	# mgnt_ids=Management.pluck(:id)
	# 100.times do
	# 	mgnt=Management.find(mgnt_ids[rand(mgnt_ids.length)])
	# 	atvt=mgnt.activities.create(
	# 		name: Faker::Name.name,
	# 		completed: rand(0..1)
	# 	)
	# 	puts "Activity #{atvt.id} created"
	# end

	# atvt_ids=Activity.pluck(:id)
	# 100.times do
	# 	atvt=Activity.find(atvt_ids[rand(atvt_ids.length)])
	# 	task=atvt.tasks.create(
	# 		name: Faker::Name.name,
	# 		started_at: (Date.today + rand(1..30).days) - rand(12).months
	# 	)
	# 	puts "Task #{task.id} created"
	# end

	# User.find_each do |user|
	# 	requested_connections = Connection.includes(:requested).where(user_id: user.id, status: 'accepted').pluck(:connected_user_id)
	# 	received_connections = Connection.includes(:received).where(connected_user_id: user.id, status: 'accepted').pluck(:user_id)
	# 	connected_user_ids = requested_connections + received_connections
	# 	User.where(id: user.id).update_all(connected_user_ids: connected_user_ids)
	# 	puts user.connected_user_ids
	# end

end