require 'rails_helper'

RSpec.describe LineItem, type: :model do

  context "associations" do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
    it { should have_many(:bundle_totals) }

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

        expect(@line_item.bundle_totals[0].bundle_quantity).to eq 1
        expect(@line_item.bundle_totals[0].bundle_size).to eq 10
        expect(@line_item.bundle_totals[0].bundle_cost).to eq 12.99
      end

      it "calculates one bundle of 5 roses when order quantity is 5" do
        @line_item.quantity = 5
        @line_item.save

        expect(@line_item.bundle_totals[0].bundle_quantity).to eq 1
        expect(@line_item.bundle_totals[0].bundle_size).to eq 5
        expect(@line_item.bundle_totals[0].bundle_cost).to eq 6.99
      end

      it "calculates one bundle of 5 and one bundle of 10 roses when order quantity is 15" do
        @line_item.quantity = 15
        @line_item.save

        expect(@line_item.bundle_totals[0].bundle_quantity).to eq 1
        expect(@line_item.bundle_totals[0].bundle_size).to eq 10
        expect(@line_item.bundle_totals[0].bundle_cost).to eq 12.99

        expect(@line_item.bundle_totals[1].bundle_quantity).to eq 1
        expect(@line_item.bundle_totals[1].bundle_size).to eq 5
        expect(@line_item.bundle_totals[1].bundle_cost).to eq 6.99

      end

      it "raises an error if order quantity cannot be broken into available bundle sizes" do
        @line_item.quantity = 12
        @line_item.save
        expect(@line_item.errors.messages[:quantity]).to include("must be divisible by the following pack sizes: 10,5")
      end

      describe "additional order quantities based on coding brief supplied" do

        it "calculates one bundle of 9 and onle bundle of 6 when 15 lillies are ordered" do

          @line_item.product = build(:product, name: "Lily", code: "L09")
          @line_item.product.bundles = [build(:bundle_one_lily), build(:bundle_two_lily), build(:bundle_three_lily)]
          @line_item.quantity = 15
          @line_item.save

          expect(@line_item.bundle_totals[0].bundle_quantity).to eq 1
          expect(@line_item.bundle_totals[0].bundle_size).to eq 9
          expect(@line_item.bundle_totals[0].bundle_cost).to eq 24.95

          expect(@line_item.bundle_totals[1].bundle_quantity).to eq 1
          expect(@line_item.bundle_totals[1].bundle_size).to eq 6
          expect(@line_item.bundle_totals[1].bundle_cost).to eq 16.95
        end

        pending "calculates two bundles of 5 and onle bundle of 3 when 13 tulips are ordered" do

          @line_item.product = build(:product, name: "Tulip", code: "T58")
          @line_item.product.bundles = [build(:bundle_one_tulip), build(:bundle_two_tulip), build(:bundle_three_tulip)]
          @line_item.quantity = 13
          @line_item.save

          expect(@line_item.bundle_totals[0].bundle_quantity).to eq 2
          expect(@line_item.bundle_totals[0].bundle_size).to eq 5
          expect(@line_item.bundle_totals[0].bundle_cost).to eq 9.95

          expect(@line_item.bundle_totals[1].bundle_quantity).to eq 1
          expect(@line_item.bundle_totals[1].bundle_size).to eq 3
          expect(@line_item.bundle_totals[1].bundle_cost).to eq 5.95
        end

      end

    end


  end

end