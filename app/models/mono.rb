class Mono < ApplicationRecord
  extend FriendlyId

  belongs_to :college
  belongs_to :course

  validates_uniqueness_of :title

  validates_presence_of :title, :year, :author, :abstract,
                        :college, :course                 

  friendly_id :title, use: :slugged

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
