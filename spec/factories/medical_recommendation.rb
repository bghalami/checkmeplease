FactoryBot.define do
  factory :medical_recommendation do
    recommendation_number { 20 }
    issuer {"Dr Dokter"}
    state { "California" }
    expiration_date { DateTime.new(2000, 8, 11)}
    path_to_image { "/file/file/file.jpg" }
    user { association(:user) }
  end
end
