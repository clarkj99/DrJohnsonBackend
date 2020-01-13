class Encounter < ApplicationRecord
  belongs_to :patient, class_name: "User"
  belongs_to :provider, class_name: "User"

  has_one :hpi, dependent: :destroy
end
