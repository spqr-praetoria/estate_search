# User user
User.create(
  email: "claimant@example.com",
  password: "password",
  first_name: "User",
  last_name: "User",
  role: :claimant
)

User.create(
  email: "claimant2@example.com",
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

User.create(
  email: "lawyer2@example.com",
  password: "password",
  first_name: "Lawyer",
  last_name: "Lawyer",
  role: :lawyer
)

# 10 questions for first user
10.times do |i|
  Question.create(
    user: User.first,
    title: "Question #{i}",
    body: "Question #{i} body",
    category: %i[ general missing_assets wills_and_probate legal_heirship ].sample
  )
end

# 5 questions for second user
5.times do |i|
  Question.create(
    user: User.second,
    title: "Question #{i}",
    body: "Question #{i} body",
    category: %i[ general missing_assets wills_and_probate legal_heirship ].sample
  )
end

# Random number of answers per question, some questions will have no answers
Question.all.each do |question|
  rand(0..10).times do |i|
    question.answers.create(
      lawyer: User.lawyer.sample,
      body: "Answer #{i} body",
      proposed_fee: rand(100..1000),
      status: "unpaid"
    )
  end
end

# 1 payment per answer
Answer.all.each do |answer|
  Payment.create(
    user: User.claimant.sample,
    answer: answer,
    amount: answer.proposed_fee,
    status: 0
  )
end
