class Mono < ApplicationRecord
  belongs_to :college
  belongs_to :course

  validates_presence_of :title, :year, :author,
                        :abstract, :college, :course
end
