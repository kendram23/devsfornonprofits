# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "MyString"
    description "MyText"
    project_deadlin "2013-12-07"
    category "MyString"
    completed false
    user_id 1
  end
end
