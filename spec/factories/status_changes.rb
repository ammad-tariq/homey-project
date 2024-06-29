FactoryBot.define do
  factory :status_change do
    from_status { :planning }
    to_status { :in_progress }
    association :project
    association :user
  end
end
