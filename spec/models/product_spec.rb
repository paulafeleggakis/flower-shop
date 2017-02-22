require 'rails_helper'

RSpec.describe Product, type: :model do

  context "associations" do
    it { should have_many(:bundles) }
    it { should have_many(:line_items) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
  end

end