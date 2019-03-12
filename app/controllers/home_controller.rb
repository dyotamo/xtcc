class HomeController < ApplicationController
  def index
    @monos = Mono.order(:created_at).reverse_order.limit(10)
  end
end
