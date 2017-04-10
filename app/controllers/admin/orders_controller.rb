class Admin::OrdersController < AdminController
  before_action :set_order, only: [:show, :ship, :shipped, :cancel, :return]


  def index
    @orders = Order.order("id DESC")
  end

  def show
    @product_lists = @order.product_lists
  end

  def ship
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def cancel
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to :back
  end

  def return
    @order.return_good!
    redirect_to :back
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
