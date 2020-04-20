class CreateCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.integer :phone
      t.integer :pay_type

      t.timestamps
    end
  end
end
