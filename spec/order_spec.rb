require 'rails_helper'

RSpec.describe Order, type: :model do

  context "associations" do
    it { should have_many(:line_items) }
  end

end