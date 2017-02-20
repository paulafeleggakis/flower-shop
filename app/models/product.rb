class Product < ApplicationRecord

  has_many :bundles
  has_many :line_items

end
