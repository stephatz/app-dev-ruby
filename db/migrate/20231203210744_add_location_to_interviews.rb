class AddLocationToInterviews < ActiveRecord::Migration[7.0]
  def change
    add_column :interviews, :location, :string
  end
end
