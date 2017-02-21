class LineItemsController < ApplicationController
  before_action :set_item, only: [:destroy]
  before_filter :load_order

  def index
    @line_items = @order.line_items
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = @order.line_items.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to order_line_items_url, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def load_order
    @order = Order.find(params[:order_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:order_id, :line_item_id, :product_id, :quantity)
  end
end
