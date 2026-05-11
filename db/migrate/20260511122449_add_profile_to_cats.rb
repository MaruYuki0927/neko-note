class AddProfileToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :age, :integer
    add_column :cats, :introduction, :text
  end
end
