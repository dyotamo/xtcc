class AddUrlToMono < ActiveRecord::Migration[5.2]
  def change
    add_column :monos, :url, :string
  end
end
