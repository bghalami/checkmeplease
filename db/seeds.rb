user1 = User.create(name: "Ben", email_address: "ben@ben.com", date_of_birth: DateTime.new(1992, 8, 5));
user2 = User.create(name: "Ken", email_address: "ken@ken.com", date_of_birth: DateTime.new(1991, 8, 6));
user3 = User.create(name: "Ren", email_address: "ren@ren.com", date_of_birth: DateTime.new(1993, 8, 7));
puts "User's seeded"
user1.state_id = StateId.create(id_number: 4, state: "Kansas", expiration_date: DateTime.new(1995, 8, 5), path_to_image: "/file/file/file/file.jpg")
user2.state_id = StateId.create(id_number: 5, state: "Kansas", expiration_date: DateTime.new(1995, 8, 5), path_to_image: "/file/file/file/file.jpg")
user3.state_id = StateId.create(id_number: 6, state: "Kansas", expiration_date: DateTime.new(1995, 8, 5), path_to_image: "/file/file/file/file.jpg")
puts "State ID's seeded"
user1.medical_recommendation = MedicalRecommendation.create(recommendation_number: 4, issuer: "A Doctor", state: "Kansas", expiration_date: DateTime.new(1995, 8, 5), path_to_image: "/file/file/file/file.jpg")
user2.medical_recommendation = MedicalRecommendation.create(recommendation_number: 5, issuer: "A Doctor", state: "Kansas", expiration_date: DateTime.new(1995, 8, 5), path_to_image: "/file/file/file/file.jpg")
user3.medical_recommendation = MedicalRecommendation.create(recommendation_number: 6, issuer: "A Doctor", state: "Kansas", expiration_date: DateTime.new(1995, 8, 5), path_to_image: "/file/file/file/file.jpg")
puts "Medical Recommendations Seeded"

puts "Seeding Complete"
