class SearchController < ApplicationController
  def view
    @text = params[:search][:text]
    redirect_to root_path if @text.nil? || @text.empty?
    @results = Mono.where("title like ?", "%#{@text}%").paginate(:page => params[:page], :per_page => 10)
  end
end
