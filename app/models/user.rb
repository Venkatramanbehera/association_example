class User < ApplicationRecord
    has_many :blogs
    has_and_belongs_to_many :courses

    has_many :user_projects
    has_many :projects, through: :user_projects

    has_one :demo
    has_one :department
end
