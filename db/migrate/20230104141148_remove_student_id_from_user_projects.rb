class RemoveStudentIdFromUserProjects < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_projects, :student, null: false, foreign_key: true
  end
end
