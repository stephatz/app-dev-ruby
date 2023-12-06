# == Schema Information
#
# Table name: interviews
#
#  id             :integer          not null, primary key
#  date           :date
#  interview_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  job_id         :integer
#
# Indexes
#
#  index_interviews_on_job_id  (job_id)
#
# Foreign Keys
#
#  job_id  (job_id => jobs.id)
#
class Interview < ApplicationRecord
  belongs_to :job, required: true, class_name: "Job", foreign_key: "job_id"
  has_many  :questions, class_name: "Question", foreign_key: "interview_id", dependent: :destroy
  belongs_to :job
  validates(:interview_type, presence: true)
end
