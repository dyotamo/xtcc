require "uri"

class Requisition < ApplicationRecord
  validates_presence_of :url
  validate :valid_url

  private

  def valid_url
    if !self.url.match(URI::regexp)
      self.errors.add(:url, "inválido")
    end
  end
end
