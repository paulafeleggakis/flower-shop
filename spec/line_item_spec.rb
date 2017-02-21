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

    context "simple rose bundle quantities" do

      pending "calculates single bundle of 5 roses when order quantity is 5" do

      end

      pending "calculates one bundle of 10 roses when order quantity is 10" do

      end

      pending "calculates one bundle of 5 and one bundle of 10 roses when order quantity is 15" do

      end

      pending "raises an error if order quantity cannot be broken into available bundle sizes" do

      end

    end

    context "order quantities based on coding brief supplied" do

    end

  end

end