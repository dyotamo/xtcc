class Mono < ApplicationRecord
  belongs_to :college
  belongs_to :course
  belongs_to :user

  has_one_attached :document

  validates_presence_of :title, :year, :author, :abstract,
                        :college, :course, :document

  private

  before_validation do |mono|
    doc = mono.document
    if doc.attached?
      if doc.content_type != "application/pdf"
        mono.errors.add(:document, "deve ser PDF")
      end
    end
  end
end
