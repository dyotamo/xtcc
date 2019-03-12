class CreateRequisitions < ActiveRecord::Migration[5.2]
  def change
    create_table :requisitions do |t|
      t.string :url

      t.timestamps
    end
  end
end
