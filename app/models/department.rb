class Department < ApplicationRecord
  belongs_to :user
  has_one :manager
  has_one :manager_history, through: :manager
end
