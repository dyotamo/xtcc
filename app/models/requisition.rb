require "uri"

class Requisition < ApplicationRecord
  private

  before_validation do |req|
    if !req.url.match(URI::regexp)
      self.errors.add(:url, "é inválido")
    end
  end
end
