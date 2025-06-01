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

# Create 10 lawyers
lawyer_names = [
  { first_name: "James", last_name: "Harrington" },
  { first_name: "Sarah", last_name: "Montgomery" },
  { first_name: "Thomas", last_name: "Blackwood" },
  { first_name: "Emma", last_name: "Chamberlain" },
  { first_name: "William", last_name: "Fitzgerald" },
  { first_name: "Sophie", last_name: "Worthington" },
  { first_name: "Michael", last_name: "Ashworth" },
  { first_name: "Charlotte", last_name: "Bennett" },
  { first_name: "David", last_name: "Cavendish" },
  { first_name: "Olivia", last_name: "Somerset" }
]

lawyer_names.each_with_index do |lawyer, index|
  User.create(
    email: "lawyer#{index + 1}@example.com",
    password: "password",
    first_name: lawyer[:first_name],
    last_name: lawyer[:last_name],
    role: :lawyer
  )
end

# Sample questions for each category
questions = {
  general: [
    {
      title: "How do I start the inheritance process?",
      body: "My father recently passed away and I'm not sure where to begin with the inheritance process. What are the first steps I should take? Do I need to contact a lawyer immediately or are there documents I should gather first?"
    },
    {
      title: "What documents do I need for inheritance?",
      body: "I'm trying to organize all the necessary paperwork for my inheritance claim. Could you list the essential documents I need to gather? I'm particularly unsure about what proof of relationship I need to provide."
    },
    {
      title: "How long does inheritance process take?",
      body: "My mother passed away 3 months ago and I'm still waiting for the inheritance process to complete. What's the typical timeline for inheritance claims in the UK? Are there ways to speed up the process?"
    }
  ],
  missing_assets: [
    {
      title: "Can't find my father's bank accounts",
      body: "My father passed away and I'm trying to locate all his bank accounts. He had accounts with multiple banks but I'm not sure which ones. How can I find out about all his accounts? Is there a central database I can check?"
    },
    {
      title: "Missing property deeds in inheritance",
      body: "While going through my late uncle's documents, I can't find the deeds to his property. He owned a house but I can't locate the paperwork. How can I prove ownership and transfer the property to the beneficiaries?"
    },
    {
      title: "Lost share certificates",
      body: "My mother had investments in several companies but I can't find the share certificates. How can I track down these investments and claim them as part of the inheritance?"
    }
  ],
  wills_and_probate: [
    {
      title: "Disputed will validity",
      body: "My sister is contesting our father's will, claiming he wasn't of sound mind when he made it. The will was signed 6 months before his death. What evidence do we need to prove its validity?"
    },
    {
      title: "Executor not fulfilling duties",
      body: "The executor of my mother's estate is not responding to my communications and hasn't distributed any assets in over a year. What can I do to ensure the estate is properly administered?"
    },
    {
      title: "Inheritance tax calculation help",
      body: "I'm trying to calculate the inheritance tax on my father's estate. The total value is around £450,000, including his house and savings. How much tax will be due and are there any reliefs we can claim?"
    }
  ],
  legal_heirship: [
    {
      title: "Proving relationship to deceased",
      body: "I was adopted as a child and need to prove my relationship to my biological father who recently passed away. What documents do I need to establish my claim to the inheritance?"
    },
    {
      title: "Inheritance rights of stepchildren",
      body: "My stepfather passed away without a will. I lived with him from age 10 to 18, but he never formally adopted me. Do I have any rights to his estate?"
    },
    {
      title: "Multiple marriages inheritance",
      body: "My father was married twice and had children from both marriages. He passed away without a will. How will his estate be divided between his two families?"
    }
  ]
}

# Sample answers for different types of questions
answers = {
  general: [
    {
      body: "The first step in the inheritance process is to determine if there's a valid will. If there is, you'll need to apply for a Grant of Probate. If there isn't, you'll need to apply for Letters of Administration. I recommend gathering all relevant documents first, including the death certificate, any existing will, and proof of your relationship to the deceased. While you can start this process yourself, consulting a lawyer can help ensure everything is handled correctly and efficiently.",
      proposed_fee: 250
    },
    {
      body: "For inheritance claims, you'll need: 1) Death certificate, 2) Original will (if one exists), 3) Birth certificates proving your relationship, 4) Marriage certificates (if applicable), 5) Bank statements and financial records, 6) Property deeds, 7) Any relevant tax documents. I can help you organize these documents and ensure they meet the legal requirements for your claim.",
      proposed_fee: 200
    },
    {
      body: "The inheritance process typically takes 6-12 months, but can be longer if the estate is complex or if there are disputes. The timeline includes: 1) Applying for Grant of Probate (4-8 weeks), 2) Collecting assets (2-3 months), 3) Paying debts and taxes (1-2 months), 4) Distributing the estate (1-2 months). To speed up the process, ensure all documents are in order and consider using a professional executor.",
      proposed_fee: 300
    }
  ],
  missing_assets: [
    {
      body: "To locate your father's bank accounts, you can: 1) Check his personal records for bank statements, 2) Contact the main UK banks with a death certificate and Grant of Probate, 3) Use the Unclaimed Assets Register, 4) Check for any standing orders or direct debits in his records. As your lawyer, I can help draft the necessary letters to banks and handle the correspondence.",
      proposed_fee: 350
    },
    {
      body: "If the property deeds are missing, you can obtain copies from the Land Registry. I'll need to: 1) Search the Land Registry records, 2) Apply for official copies of the title register, 3) Help you complete the necessary forms to transfer ownership. The process typically takes 2-3 weeks once we have the Grant of Probate.",
      proposed_fee: 400
    },
    {
      body: "To track down lost share certificates, we can: 1) Contact the company registrars, 2) Search the Unclaimed Assets Register, 3) Check with the deceased's stockbroker if they had one, 4) Look for dividend payments in bank statements. I can help you contact the relevant companies and handle the transfer of shares once located.",
      proposed_fee: 450
    }
  ],
  wills_and_probate: [
    {
      body: "To prove the will's validity, we'll need to demonstrate: 1) Your father had testamentary capacity when making the will, 2) He understood the nature of the document, 3) He knew the extent of his estate, 4) He understood the claims of potential beneficiaries. I can help gather medical records, witness statements, and other evidence to support the will's validity.",
      proposed_fee: 500
    },
    {
      body: "If the executor is not fulfilling their duties, you can: 1) Apply to the court to remove them, 2) Request an inventory of the estate, 3) Apply for a court order to compel distribution. I can help you prepare the necessary court applications and represent you in any proceedings. The process typically takes 3-6 months.",
      proposed_fee: 600
    },
    {
      body: "For an estate worth £450,000, the inheritance tax calculation would be: 1) Nil-rate band of £325,000, 2) Tax at 40% on the remaining £125,000 = £50,000. However, if the property is left to direct descendants, you may qualify for the Residence Nil-Rate Band of £175,000, potentially reducing the tax. I can help you identify all available reliefs and exemptions.",
      proposed_fee: 400
    }
  ],
  legal_heirship: [
    {
      body: "To prove your relationship as an adopted child, you'll need: 1) Your adoption certificate, 2) Your original birth certificate, 3) Any court orders related to the adoption, 4) DNA evidence if available. I can help you gather these documents and present them to the court in a way that establishes your claim to the inheritance.",
      proposed_fee: 550
    },
    {
      body: "As a stepchild, your rights depend on several factors: 1) Whether you were financially dependent on your stepfather, 2) The length of your relationship, 3) Whether you were treated as a child of the family. While you don't have automatic inheritance rights, you may be able to make a claim under the Inheritance Act 1975. I can assess your specific situation and advise on the best course of action.",
      proposed_fee: 450
    },
    {
      body: "In cases of intestacy with multiple marriages, the estate is distributed according to specific rules: 1) If there are children from both marriages, they share equally, 2) The surviving spouse receives the first £270,000 plus half the remainder, 3) The other half is divided among the children. I can help you understand how these rules apply to your specific situation and ensure fair distribution.",
      proposed_fee: 500
    }
  ]
}

# Create questions and answers
questions.each do |category, category_questions|
  category_questions.each do |question_data|
    question = Question.create(
      user: User.first,
      title: question_data[:title],
      body: question_data[:body],
      category: category
    )

    # Add 1-3 answers for each question
    rand(1..3).times do
      answer_data = answers[category].sample
      question.answers.create(
        lawyer: User.lawyer.sample,
        body: answer_data[:body],
        proposed_fee: answer_data[:proposed_fee],
        status: "unpaid"
      )
    end
  end
end

# Create some questions without answers
Question.create(
  user: User.first,
  title: "How to handle joint bank account after death?",
  body: "My mother recently passed away and she had a joint bank account with my father. The account has a significant amount of money in it. My father is still alive and using the account. Do I need to include this money in the inheritance tax calculation? What are the legal implications of a joint account in this situation?",
  category: Question.categories.keys.sample,
  status: :open
)

Question.create(
  user: User.first,
  title: "Inheritance dispute with sibling over family business",
  body: "My father left his small business to both me and my brother in his will. However, my brother is claiming he should have full control because he worked in the business for 20 years while I pursued a different career. The business is worth approximately £250,000. What are my rights as a co-owner? Can he force me to sell my share?",
  category: Question.categories.keys.sample,
  status: :open
)

Question.create(
  user: User.first,
  title: "Missing beneficiary in will distribution",
  body: "I'm the executor of my aunt's estate. Her will was written 10 years ago and left equal shares to her three children. However, one of her children has been missing for over 5 years and we can't locate them. The estate is worth around £300,000. How should I proceed with the distribution? Do I need to hold their share in trust? What are my legal obligations as executor?",
  category: Question.categories.keys.sample,
  status: :open
)

# 1 payment per answer
Answer.all.each do |answer|
  Payment.create(
    user: User.claimant.sample,
    answer: answer,
    amount: answer.proposed_fee,
    status: 0
  )
end
