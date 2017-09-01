FactoryGirl.define do
  factory :item do
    name { Faker::GamesOfThrones.character }
    done false
    todo_id nil
  end
end
