class Order < ApplicationRecord

  has_many :line_items

  def total_cost
    line_items.inject(0){|memo,item| memo + item.item_total_cost}
  end

end
