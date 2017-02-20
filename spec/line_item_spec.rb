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

end