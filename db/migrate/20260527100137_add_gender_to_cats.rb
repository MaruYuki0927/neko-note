class AddGenderToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :gender, :string
  end
end
