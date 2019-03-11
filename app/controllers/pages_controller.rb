require "uri"

class PagesController < ApplicationController
  def request_upload
  end

  def do_request_upload
    if params[:request][:url] =~ URI::regexp
      redirect_to root_path, notice: "Request made successfully!"
      return
    end
    render :request_upload
  end

  def about
  end
end
