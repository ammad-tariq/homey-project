# spec/factories/comments.rb
FactoryBot.define do
  factory :comment do
    content { "This is a comment." }
    project
    user
  end
end
