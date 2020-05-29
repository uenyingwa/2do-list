FactoryGirl.define do
  factory :item do
    name { Faker::GameOfThrones.character }
    done false
    todo_id nil
  end
end
