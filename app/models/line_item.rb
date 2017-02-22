class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: true

  def calculate_bundle_quantities
    bundle_quantities = []
    quantity = self.quantity

    sorted_bundles = product.bundles.map{|bundle| [bundle.bundle_quantity, bundle.bundle_cost]}.sort {|a,b| b[1] <=> a[1]}

    sorted_bundles.each do |bundle|
      num_bundles =  quantity / bundle[0]
      quantity = quantity % bundle[0]
      bundle_quantities << [num_bundles, bundle[0], bundle[1]] if num_bundles!=0
    end

    bundle_quantities
  end


end
