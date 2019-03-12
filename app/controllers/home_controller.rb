class HomeController < ApplicationController
  def index
    @monos = Mono.order(:created_at).limit(10)
  end
end
