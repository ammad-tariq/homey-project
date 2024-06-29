# db/seeds.rb

# Create Users
user1 = User.create!(email: 'ammad@example.com', password: 'password', first_name: 'Ammad', last_name: 'Tariq')
user2 = User.create!(email: 'jane@example.com', password: 'password', first_name: 'Jane', last_name: 'Smith')
user3 = User.create!(email: 'john@example.com', password: 'password', first_name: 'John', last_name: 'Doe')

# Create Projects
project1 = Project.create!(title: 'Project 1', status: :review, user: user1)
project2 = Project.create!(title: 'Project 2', status: :in_progress, user: user2)
project3 = Project.create!(title: 'Project 3', status: :review, user: user3)

# Create Comments
Comment.create!(content: 'This is a comment.', project: project1, user: user1)
Comment.create!(content: 'This is another comment.', project: project1, user: user2)
Comment.create!(content: 'This is yet another comment.', project: project2, user: user3)

# Create Status Changes
StatusChange.create!(project: project1, user: user1, from_status: 0, to_status: 1) # in_progress
StatusChange.create!(project: project1, user: user2, from_status: 1, to_status: 2) # review
StatusChange.create!(project: project2, user: user3, from_status: 0, to_status: 1) # in_progress
StatusChange.create!(project: project3, user: user3, from_status: 1, to_status: 2) # review

puts "Seeding completed successfully."
