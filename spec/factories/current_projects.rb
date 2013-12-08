# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :current_project, :class => 'CurrentProjects' do
    user_id 1
    project_id 1
    description "MyText"
    completed false
  end
end
