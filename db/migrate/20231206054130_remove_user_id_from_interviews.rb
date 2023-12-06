class RemoveUserIdFromInterviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :interviews, :user, null: true, foreign_key: false
  end
end
