require "uri"

class Requisition < ApplicationRecord
  validate :valid_url
  # validates_presence_of :url

  private

  def valid_url
    if !self.url.match(URI::regexp)
      self.errors.add(:url, "inválido")
    end
  end
end
