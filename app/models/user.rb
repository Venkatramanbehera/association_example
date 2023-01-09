class User < ApplicationRecord
    has_many :blogs
    has_and_belongs_to_many :courses

    has_many :user_projects
    has_many :projects, through: :user_projects

    has_one :demo
    has_one :department

    validates :name, :email, presence: true
    validates :email, uniqueness: true
    validates :name, length: { minimum: 2, maximum: 50 }
    validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters are allowed'}

    # custom validations
    validate :validate_student_age 

    def validate_student_age
        if self.date_of_birth.present?
            age = Date.today.year - self.date_of_birth.year 
            if age < 15 
                errors.add(:age, 'Please provide a valid date of birth here . Age must be greater than 15.')
            end 
        end
    end

    # before_validation :normalize_name, on: :create
    before_create :greetings_message
    after_create :dispaly_student_age 
    before_create do 
        # if there is one line of exection then its ok
        puts "Runs before creating an object "
    end 

    def dispaly_student_age 
        if self.date_of_birth.present?
            age = Date.today.year() - self.date_of_birth.year
            puts "-------- Age of the user is #{age} ++++++++++++ "
        else  
            puts "Can not be caluclated without date_of_birth"
        end
    end

    def greetings_message 
        puts "Hey! I will run before you create an object."
    end

    def normalize_name 
        self.name = name.downcase.titleize
    end

    
end