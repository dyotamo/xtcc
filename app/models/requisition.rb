require "uri"

class Requisition < ApplicationRecord
  private

  before_validation do |req|
    if !req.url.match(URI::regexp)
      msg = "é inválido. Ex: https://drive.google.com/open?id=xpto"
      self.errors.add(:url, msg)
    end
  end
end
