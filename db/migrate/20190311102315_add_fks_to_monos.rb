class AddFksToMonos < ActiveRecord::Migration[5.2]
  def change
    add_reference :monos, :course, foreign_key: true
    add_reference :monos, :college, foreign_key: true
  end
end
