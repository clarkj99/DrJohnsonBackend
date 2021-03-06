class Encounter < ApplicationRecord
  belongs_to :patient, class_name: "User"
  belongs_to :provider, class_name: "User"

  has_one :intake, dependent: :destroy
  has_one :hpi, dependent: :destroy
  has_one :rosystem, dependent: :destroy
  has_one :problem_exam, dependent: :destroy
  has_one :diagnosis, dependent: :destroy

  enum status: [:open, :closed]
end
