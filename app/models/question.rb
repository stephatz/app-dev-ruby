# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  answer       :string
#  question     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  interview_id :integer
#
class Question < ApplicationRecord
  belongs_to :interview, required: true, class_name: "Interview", foreign_key: "interview_id"

  validates(:question, presence: true)
  validates(:interview_id, presence: true)
end
