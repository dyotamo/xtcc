class Mono < ApplicationRecord
  belongs_to :college
  belongs_to :course
  belongs_to :user

  validates_presence_of :title, :year, :author, :abstract,
                        :college, :course

  private

  def validate_year(mono)
    if !(2000..Time.now.year).include? mono.year
      mono.errors.add(:year, "fora do intervalo permitido")
    end
  end

  before_validation do |mono|
    validate_year mono
  end
end
