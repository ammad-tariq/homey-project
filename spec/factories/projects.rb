# spec/factories/projects.rb
FactoryBot.define do
  factory :project do
    sequence(:title) { |n| "Project #{n}" }
    user
    status { :planning }
  end
end
