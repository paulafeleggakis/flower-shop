class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: true

  def calculate_bundle_quantities

    totals = []

    bundle_quantities = product.packs.map(&:quantity).sort!.reverse

    bundle_quantities.each do |bundle|
      if quantity%bundle[0] == 0
        totals << [quantity/bundle[0], bundle[0], bundle[1]]
        return totals
        break
      end
    end
  end


end
