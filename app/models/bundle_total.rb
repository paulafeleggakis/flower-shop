class BundleTotal < ApplicationRecord

  belongs_to :line_item

  validates :bundle_quantity, presence: true, numericality: true
  validates :bundle_size, presence: true, numericality: true
  validates :bundle_cost, presence: true, numericality: true

end
