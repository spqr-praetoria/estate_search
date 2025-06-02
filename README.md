# README

Production
[https://playground-white-thunder-762.fly.dev/](https://playground-white-thunder-762.fly.dev/)

Explanation
[Demo Video 1](https://www.loom.com/share/7a46802e9d184b829bcb9609974092ef)  
[Demo Video 2](https://www.loom.com/share/0e4ea1522b6246b899d5f7e0bbcaccb6)


### Prerequisites
- Ruby 3.4.2
- Node v22.14.0
- yarn 1.22.19

### Setup
```
git clone git@github.com:spqr-praetoria/estate_search.git

bin/setup
rails db:seed

# If setup fails
rails db:create
rails db:migrate
rails db:seed

# to start the server
bin/dev
```

Sign in
### Claimants
- claimaint@example.com
- claimant2@example.com

### Lawyers
- lawyer1@example.com 
- lawyer2@example.com
- ... > lawyer10@example.com

### Admin
There is an admin but the page has nothing.


### Tech stack
- rspec (testing)
- vite_rails (HRM)
- action_policy
- SQLite3 (For a cheap demo with no postges setup)

### Structure
- I split everything out into their own sub folder
  - Claimant
  - Lawyer
  - Admin

  This is so that each can have their own views and I can creat policies according to the use role.

### Hotwire
- Using hotwire for dynamic events
- Turbo streams for real time updates






