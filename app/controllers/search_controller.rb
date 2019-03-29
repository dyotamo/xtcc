class SearchController < ApplicationController
  def view
    @args = params[:search][:args]

    if @args.nil? || @args.empty?
      redirect_to root_path
    end

    @results = Mono.where("title like ? or author like ? or abstract like ?",
                          "%#{@args}%", "%#{@args}%", "%#{@args}%")
      .paginate(:page => params[:page], :per_page => 10)
  end
end
