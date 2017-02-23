require 'rails_helper'

RSpec.describe Order, type: :model do

  context "calculate_order_total" do

    it "calculates the total cost of all line items in an order" do

      @order = build(:order)
      @line_item = build(:line_item)
      @line_item.order = @order
      @line_item.product = build(:product, name: "Rose", code: "R12")
      @line_item.product.bundles = [build(:bundle_one_rose), build(:bundle_two_rose)]

      @line_item.quantity = 15
      @line_item.save

      expect(@order.total_cost).to eq (19.98)

    end

  end
end