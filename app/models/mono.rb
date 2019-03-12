class Mono < ApplicationRecord
  belongs_to :college
  belongs_to :course
  belongs_to :user

  has_one_attached :document

  validates_presence_of :title, :year, :author, :abstract, :college, :course, :document
  validate :pdf_type

  def pdf_type
  end
end
