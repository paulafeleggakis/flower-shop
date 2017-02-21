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

    describe "simple rose bundle quantities" do

      it "calculates single bundle of 5 roses when order quantity is 5" do

        expect line_item.calculate_bundle_quantities.to eq[[1,5,6.99]]

      end

      pending "calculates one bundle of 10 roses when order quantity is 10"

      pending "calculates one bundle of 5 and one bundle of 10 roses when order quantity is 15"

      pending "raises an error if order quantity cannot be broken into available bundle sizes"

    end

    describe "order quantities based on coding brief supplied" do

    end

  end

end