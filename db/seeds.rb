# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mike = User.create(first_name: "Mike", last_name: "Kim", username: "mk", password: "123", email: "mike@gmail.com")

joe = User.create(first_name: "Joe", last_name: "Shmo", username: "js", password: "123", email: "joe@gmail.com")

board1 = UserBoard.create(name: "On It", description: "task org project", user: mike, background_image: 'https://images.unsplash.com/photo-1454357402858-6f7bafb65814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60')

proj1 = UserProject.create(name: "backend", description: "flesh out rails", user_board: board1)

proj2 = UserProject.create(name: "frontend", description: "flesh out react", user_board: board1)

todo1 = UserTodo.create(title: "routes", description: "finish routes", user_project: proj1)

todo2 = UserTodo.create(title: "fetches", description: "get fetches done", user_project: proj2)

team = Team.create(name: "Podcast", description: "podcast project")

userteam = UserTeam.create(user: mike, team: team)

teamboard1 = TeamBoard.create(name: "Podcast Peeps", description: "podcast peeps project", team: team)

teamproj1 = TeamProject.create(name: "backend", description: "backend stuff", team_board: teamboard1)

teamproj2 = TeamProject.create(name: "frontend", description: "frontend stuff", team_board: teamboard1)

teamtodo1 = TeamTodo.create(title: "rails things", description: "finish rails things", team_project: teamproj1)

teamtodo2 = TeamTodo.create(title: "listen notes", description: "work out listen notes", team_project: teamproj2)
