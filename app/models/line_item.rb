class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: true

  def calculate_bundle_quantities

    totals = []

    bundle_quantities = product.bundles.map{|bundle| [bundle.bundle_quantity, bundle.bundle_cost]}.sort {|a,b| b[1] <=> a[1]}

    bundle_quantities.each do |bundle|
      if quantity%bundle[0] == 0
        totals << [quantity/bundle[0], bundle[0], bundle[1]]
        break
      end
    end

    totals
  end


end
