FactoryBot.define do
  factory :match do
    name Faker::Lorem.word
    venue Faker::Lorem.word
    score_player1 { 0 }
    score_player2 { 3 }
    player1_id nil
    player2_id nil
    group_id nil
  end
end
