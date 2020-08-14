class AddSlugToMonos < ActiveRecord::Migration[5.2]
  def change
    add_column :monos, :slug, :string
    add_index :monos, :slug, unique: true
  end
end
