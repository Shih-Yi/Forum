class AddAuthorToEvents < ActiveRecord::Migration
  def change
    add_column :events, :author, :string
  end
end
