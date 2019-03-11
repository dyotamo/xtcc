class CreateMonos < ActiveRecord::Migration[5.2]
  def change
    create_table :monos do |t|
      t.string :title
      t.integer :year
      t.string :author
      t.text :abstract

      t.timestamps
    end
  end
end
