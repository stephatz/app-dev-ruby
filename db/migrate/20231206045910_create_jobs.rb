class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :responsibilities
      t.string :employer

      t.timestamps
    end
  end
end
