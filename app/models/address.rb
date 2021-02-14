class Address < ApplicationRecord
  belongs_to :order

  # validates :region_id, numericality: { other_than: 1 }
end
