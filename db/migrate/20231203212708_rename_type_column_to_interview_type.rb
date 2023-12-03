class RenameTypeColumnToInterviewType < ActiveRecord::Migration[7.0]
  def change
    rename_column :interviews, :type, :interview_type
  end
end
