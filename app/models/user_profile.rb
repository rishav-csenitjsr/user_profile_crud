class UserProfile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validate :password_requirements_are_met 

    def password_requirements_are_met
        rules = {
            " must contain at least one lowercase letter"  => /[a-z]+/,
            " must contain at least one uppercase letter"  => /[A-Z]+/,
            " must contain at least one digit"             => /[0-9]+/,
            "is too short (minimum is 8 characters)"       => /.{8,}/
        }

        if password.present?
          rules.each do |message, regex|
              errors.add( :password, message ) unless password.match( regex ) 
          end
        end
    end
end
