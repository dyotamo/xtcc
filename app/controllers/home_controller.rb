class HomeController < ApplicationController
  def index
    @monos = Mono.all
  end
end
