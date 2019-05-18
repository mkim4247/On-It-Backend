# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mike = User.create(first_name: "Mike", last_name: "Kim", username: "mk", password: "123", email: "mike@gmail.com")

calvin = User.create(first_name: "Calvin", last_name: "Watterson", username: "calvin", password: "123", email: "calvin@gmail.com")

hobbes = User.create(first_name: "Hobbes", last_name: "Watterson", username: "hobbes", password: "123", email: "hobbes@gmail.com")

board1 = UserBoard.create(name: "On It", description: "Project/Task Management app", user: mike, background_image: 'https://images.unsplash.com/photo-1454357402858-6f7bafb65814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')

proj1 = UserProject.create(name: "Backend", description: "Work on backend with Ruby on Rails", user_board: board1)

proj2 = UserProject.create(name: "Front", description: "Work on frontend with React/Redux and Semantic UI", user_board: board1)

todo1 = UserTodo.create(title: "Models", description: "Flesh out models and relationships", user_project: proj1)

todo2 = UserTodo.create(title: "Controllers", description: "Figure out endpoints and routes", user_project: proj1)

todo3 = UserTodo.create(title: "Basic auth", description: "Implement basic auth with JWT and BCrypt", user_project: proj1)

todo4 = UserTodo.create(title: "Setup Fetches", description: "Test endpoints with fetches", user_project: proj2)

todo5 = UserTodo.create(title: "CSS/UI", description: "Incorporate Semantic UI for clean design/styling", user_project: proj2)

todo6 = UserTodo.create(title: "Organize State/Components", description: "Use React/Redux to organize state and handle dispatching", user_project: proj2)

team = Team.create(name: "Lazy Sundays", description: "There's never enough time to do nothing")

userteam1 = UserTeam.create(user: mike, team: team)
userteam2 = UserTeam.create(user: calvin, team: team)
userteam3 = UserTeam.create(user: hobbes, team: team)

teamboard1 = TeamBoard.create(name: "Time Wasting Ideas", description: "Scientific Progress Goes Boink", team: team, background_image: 'https://images.unsplash.com/photo-1454357402858-6f7bafb65814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')

teamproj1 = TeamProject.create(name: "Go to Space", description: "Hop in Spaceman Spiff's Spaceship", team_board: teamboard1)

teamproj2 = TeamProject.create(name: "Solve Crime", description: "Help Tracer Bullet with his cases", team_board: teamboard1)

teamproj3 = TeamProject.create(name: "Fight Evil", description: "Fight the bad guys with Stupendous Man", team_board: teamboard1)

teamtodo1 = TeamTodo.create(title: "Explore Planets", description: "Check out far out galaxies", team_project: teamproj1)

teamtodo2 = TeamTodo.create(title: "Meet Some Aliens", description: "See how the martians live", team_project: teamproj1)

teamtodo3 = TeamTodo.create(title: "Become a Jr Detective", description: "Show the force you have what it takes", team_project: teamproj2)

teamtodo4 = TeamTodo.create(title: "Make A Costume", description: "Need a mask and cape", team_project: teamproj3)

teamtodo5 = TeamTodo.create(title: "Think of a Superhero Name", description: "Need to make a cool name people will remember", team_project: teamproj3)
