class AddSubmissionDateToUserProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :user_projects, :submission_date, :date
  end
end
