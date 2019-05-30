FactoryBot.define do
  factory :user do
    name { "Ben" }
    email_address { "ben@ben.com" }
    date_of_birth { DateTime.new(2000, 8, 11)}
  end
end
