class RemoveColumnsFromInterviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :interviews, :responsibilities, :string
    remove_column :interviews, :job_title, :string
    remove_column :interviews, :employer, :string
  end
end
