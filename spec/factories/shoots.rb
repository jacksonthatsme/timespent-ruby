# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shoot do
    artist "MyString"
    description "MyText"
    location "MyString"
  end
end
