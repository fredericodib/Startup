class Student < ApplicationRecord
  	belongs_to :school

  	has_secure_password
	has_secure_token

	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email, :registration, uniqueness: true
	validates :email, :name, :registration, presence: true
	validates :password, length: { minimum: 6 }, allow_nil: true

	enum gender: [ :Masculine, :Feminine ]
	enum student_class: [ :A, :B, :C, :D, :E, :F  ]


	def self.valid_login?(email, password)
	    student = find_by(email: email)
	    if student && student.authenticate(password)
	      	student
	    end
	end
end
