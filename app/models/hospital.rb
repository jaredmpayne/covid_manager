class Hospital < ApplicationRecord
  has_many :patients

  def available_beds
    (self.total_beds&.to_i - self.patients.count).to_s
  end

  def bed?
    (self.total_beds&.to_i - self.patients.count) != 0
  end
end
