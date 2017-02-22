require 'rails_helper'

RSpec.describe LineItem, type: :model do

  context "associations" do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end

  context "validations" do
    it { should validate_presence_of(:quantity) }
    it { should validate_numericality_of(:quantity) }
  end

  context "calculate_bundle quantities" do

    before (:each) do
      @line_item = build(:line_item)
      @line_item.product = build(:product, name: "Rose", code: "R12")
      @line_item.product.bundles = [build(:bundle_one_rose), build(:bundle_two_rose)]
    end

    describe "simple rose bundle quantities" do

      it "calculates single bundle of 10 roses when order quantity is 10" do
        @line_item.quantity = 10
        @line_item.save
        expect(@line_item.calculate_bundle_quantities).to eq([[1,10,12.99]])
      end

      it "calculates one bundle of 5 roses when order quantity is 5" do
        @line_item.quantity = 5
        @line_item.save
        expect(@line_item.calculate_bundle_quantities).to eq([[1,5,6.99]])
      end

      it "calculates one bundle of 5 and one bundle of 10 roses when order quantity is 15" do
        @line_item.quantity = 15
        @line_item.save
        expect(@line_item.calculate_bundle_quantities).to eq([[1,10,12.99],[1,5,6.99]])
      end

      pending "raises an error if order quantity cannot be broken into available bundle sizes"

    end

    describe "order quantities based on coding brief supplied" do

    end

  end

end