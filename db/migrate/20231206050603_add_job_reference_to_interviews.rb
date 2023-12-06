class AddJobReferenceToInterviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :interviews, :job, null: false, foreign_key: true
  end
end
