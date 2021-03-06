class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :address
      t.string :city
      t.text :description
      t.boolean :available, default: true
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
