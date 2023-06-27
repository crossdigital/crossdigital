class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
