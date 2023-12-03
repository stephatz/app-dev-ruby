# == Schema Information
#
# Table name: interviews
#
#  id               :integer          not null, primary key
#  date             :date
#  employer         :string
#  interview_type   :string
#  job_title        :string
#  responsibilities :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class Interview < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :questions, class_name: "Question", foreign_key: "interview_id", dependent: :destroy

  validates(:job_title, presence: true)
end
