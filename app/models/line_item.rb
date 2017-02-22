class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: true

  before_create :calculate_bundle_quantities

  def calculate_bundle_quantities
    bundle_quantities = []
    quantity = self.quantity

    sorted_bundles = product.bundles.map{|bundle| [bundle.bundle_quantity, bundle.bundle_cost]}.sort {|a,b| b[1] <=> a[1]}

    sorted_bundles.each do |bundle|
      num_bundles =  quantity / bundle[0]
      quantity = quantity % bundle[0]
      bundle_quantities << [num_bundles, bundle[0], bundle[1]] if num_bundles!=0
    end


    if check_valid_quantity?(bundle_quantities, self.quantity)
      bundle_quantities
    else
      string = sorted_bundles.map{|pack|pack[0]}.map {|a| a.to_s}.join(",")
      errors.add(:quantity, "must be divisible by the following pack sizes: #{string}")
    end

  end

  private

  def check_valid_quantity?(bundle_quantities, quantity)
    calc_quantity = bundle_quantities.inject(0){|memo, bundle| memo + (bundle[0] * bundle[1])}
    calc_quantity == quantity ? true : false
  end
  
end
