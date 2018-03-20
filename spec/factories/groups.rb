FactoryBot.define do
  factory :group do
    name { Faker::Lorem.word }
    tournament_id nil
  end
end
