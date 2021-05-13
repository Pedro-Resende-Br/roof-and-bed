class RemoveCityFromFlat < ActiveRecord::Migration[6.1]
  def change
    remove_column :flats, :city, :string
  end
end
