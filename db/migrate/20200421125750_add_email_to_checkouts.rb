class AddEmailToCheckouts < ActiveRecord::Migration[6.0]
  def change
    add_column :checkouts, :email, :string
  end
end
