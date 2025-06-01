class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: {
    with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
    message: "must be a valid email like name@example.com"
  }

  validates :first_name, :last_name, presence: true

  enum :role, {
    user: 0,
    lawyer: 1,
    admin: 2
  }
end
