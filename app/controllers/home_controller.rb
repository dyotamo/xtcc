class HomeController < ApplicationController
  def index
    @monos = Mono.order(:created_at).paginate(:page => params[:page], :per_page => 10)
  end
end
