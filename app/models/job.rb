# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  employer         :string
#  job_title        :string
#  responsibilities :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_jobs_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Job < ApplicationRecord
  has_many :interviews, class_name: "Interview", foreign_key: "job_id", dependent: :destroy
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
end
