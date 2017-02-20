class Bundle < ApplicationRecord

  belongs_to :product

  validates :bundle_quantity, presence: true, numericality: true
  validates :bundle_cost, presence: true, numericality: true

end
