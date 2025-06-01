# User user
User.create(
  email: "claimant@example.com",
  password: "password",
  first_name: "User",
  last_name: "User",
  role: :claimant
)

# Admin user
User.create(
  email: "admin@example.com",
  password: "password",
  first_name: "Admin",
  last_name: "Admin",
  role: :admin
)

# Lawyer user
User.create(
  email: "lawyer@example.com",
  password: "password",
  first_name: "Lawyer",
  last_name: "Lawyer",
  role: :lawyer
)
