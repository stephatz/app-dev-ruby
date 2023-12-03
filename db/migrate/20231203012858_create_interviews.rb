class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.string :job_title
      t.integer :user_id
      t.string :responsibilities
      t.date :date
      t.string :employer

      t.timestamps
    end
  end
end
