class Product < ApplicationRecord

  has_many :bundles
  has_many :line_items

  validates_presence_of :name
  validates_presence_of :code

end
