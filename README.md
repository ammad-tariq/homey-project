# Homey Project

## Overview

The Homey Project is a Ruby on Rails application for managing project conversations. Users can create projects, leave comments, and change project statuses. The conversation history shows all comments and status changes.

## Technologies and Tools Used

- Ruby on Rails
- PostgreSQL
- Devise (user authentication)
- Slim (templating)
- Tailwind CSS (styling)
- Stimulus JS (frontend interactions)
- RSpec (testing)

## Key Features

1. **Project Attributes:**
   - Projects have a title and a status (`planning`, `in progress`, `review`, `completed`).

2. **User Authentication:**
   - Handled with Devise.
   - Passwords must include at least one uppercase letter, one lowercase letter, one digit, and one special character.

3. **Comments:**
   - Users can leave comments on projects.
   - Comments are displayed chronologically with the commenter's name.

4. **Status Changes:**
   - Users can change the status of projects.
   - Status changes are tracked and displayed chronologically with the user's name.

5. **Model Associations:**
   - User: has many projects, comments, and status changes.
   - Project: belongs to a user, has many comments and status changes.
   - Comment: belongs to a user and a project.
   - StatusChange: belongs to a user and a project.

6. **Password Complexity:**
   - Custom validation ensures passwords meet complexity requirements.

7. **User Roles:**
   - User roles are not implemented at this stage. Future stages may include admin roles for managing users and roles.

## Setup Instructions

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/homey-project.git
   cd homey-project
```

2. **Install dependencies:**
   ```sh
   bundle install
```
3. **Set up the database:**
   ```sh
   rails db:setup
```
4. **Run the server:**
   ```sh
   rails server
```
5. **Run tests:**
   ```sh
   bundle exec rspec

```
## Testing the Deployed App

You can access the deployed app on the Heroku server through this link:

https://homey-project-4801423d3cab.herokuapp.com

You can sign up with a new user or sign in through the following existing users:

`
Email: ammad@example.com, Password: Admin@123
Email: jane@example.com, Password: Admin@123
Email: john@example.com, Password: Admin@123
``
