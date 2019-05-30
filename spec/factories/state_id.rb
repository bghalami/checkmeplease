FactoryBot.define do
  factory :state_id do
    id_number { 40 }
    state { "California" }
    expiration_date { DateTime.new(2000, 8, 11)}
    path_to_image { "/file/file/file.jpg" }
    user { association(:user) }
  end
end
