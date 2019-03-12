class AddUserFkToMonos < ActiveRecord::Migration[5.2]
  def change
    add_reference :monos, :user, foreign_key: true
  end
end
