class Patient < ApplicationRecord
  belongs_to :hospital, optional: true

  def location_code
    self.hospital&.id
  end
end
