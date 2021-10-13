class Vaccination < ApplicationRecord
  enum vaccine: { phizer: 0, sinovac: 1, astra_zeneca: 2 }
  belongs_to :patient
end
