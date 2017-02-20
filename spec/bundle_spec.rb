require 'rails_helper'

RSpec.describe Bundle, type: :model do

  context "associations" do
    it { should belong_to(:product) }
  end

  context "validations" do
    it { should validate_presence_of(:bundle_quantity) }
    it { should validate_numericality_of(:bundle_quantity) }
    it { should validate_presence_of(:bundle_cost) }
    it { should validate_numericality_of(:bundle_cost) }
  end

end