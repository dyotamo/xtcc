class Mono < ApplicationRecord
  belongs_to :college
  belongs_to :course
  belongs_to :user

  has_one_attached :document

  validates_presence_of :title, :year, :author, :abstract,
                        :college, :course, :document

  private

  def validate_attachment(mono)
    if mono.document.attached?
      if mono.document.content_type != "application/pdf"
        mono.errors.add(:document, "deve ser PDF")
      end
    else
      mono.errors.add(:document, "é obrigatório")
    end
  end

  def validate_year(mono)
    if !(2000..Time.now.year).include? mono.year
      mono.errors.add(:year, "fora do intervalo permitido")
    end
  end

  before_validation do |mono|
    validate_attachment mono
    validate_year mono
  end
end
