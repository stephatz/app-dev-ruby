class RemoveLocationFromInterviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :interviews, :location, :string
  end
end
